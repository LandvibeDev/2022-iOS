//
//  MovieFinder.swift
//  NaverOpenAPITest
//
//  Created by Byeongjo Koo on 2022/08/28.
//

import Combine
import SwiftUI

class MovieFinder: ObservableObject {
    
    @Published var searchForm = SearchForm()
    @Published private(set) var fetchStatus = FetchStatus.idle
    @Published private(set) var boxOffice = BoxOffice()
    
    private let fetcher: Fetchable
    
    var isKeywordCorrectable: Bool {
        searchForm.correction.isEmpty == false
    }
    
    // MARK: Initializer(s)
    
    init(fetcher: Fetchable) {
        self.fetcher = fetcher
        startSearchProceedableStream()
    }
    
    // MARK: Intent(s)
    
    func handleTypo() {
        searchForm.handleTypo()
    }
    
    // MARK: Search Proceedable Control
    
    private let searchDebounceSeconds = 2
    private var searchProceedableStream: AnyCancellable?
    
    private var checkTypo: AnyPublisher<(String, String), Never> {
        $searchForm
            .map(\.keyword)
            .removeDuplicates()
            .handleEvents(receiveOutput: { keyword in
                DispatchQueue.main.async(qos: .userInteractive) { [weak self] in
                    self?.searchForm.isProceedable = false
                    self?.fetchStatus = keyword.isEmpty ? .idle : .fetching
                }
            })
            .debounce(for: .seconds(searchDebounceSeconds), scheduler: RunLoop.main)
            .removeDuplicates()
            .flatMap({ keyword in
                Future<(String, String), Never> { [weak self] promise in
                    if keyword.isEmpty {
                        promise(.success((keyword, "")))
                    } else {
                        self?.fetchTypo(for: keyword) { correction in
                            promise(.success((keyword, correction)))
                        }
                    }
                }
            })
            .eraseToAnyPublisher()
    }
    
    private var checkGenre: AnyPublisher<SearchForm.Genre, Never> {
        $searchForm
            .map(\.genre)
            .removeDuplicates()
            .eraseToAnyPublisher()
    }
    
    private var checkSearchProceedable: AnyPublisher<Bool, Never> {
        checkTypo.combineLatest(checkGenre)
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveOutput: { [weak self] typo, _ in
                let (_, correction) = typo
                self?.searchForm.correction = correction
            })
            .map({ typo, genre in
                let (keyword, correction) = typo
                return keyword.isEmpty == false && correction.isEmpty && genre != .none
            })
            .eraseToAnyPublisher()
    }
    
    private func startSearchProceedableStream() {
        searchProceedableStream = checkSearchProceedable
            .receive(on: DispatchQueue.main)
            .sink { [weak self] output in
                self?.fetchStatus = .idle
                self?.searchForm.isProceedable = output
            }
    }
    
    private func cancelSearchProceedableStream() {
        typoFetchingStream = nil
        searchProceedableStream = nil
    }
    
    // MARK: Error Handling
    
    func errorHandling(_ error: Error) {
        //TODO: Alert Error Handling
        print(error)
    }
    
    // MARK: Fetching Typo
    
    private var typoFetchingStream: AnyCancellable?
    
    private func fetchTypo(for keyword: String, completion: @escaping (String) -> Void) {
        typoFetchingStream?.cancel()
        typoFetchingStream = fetcher.fetch(with: NaverOpenAPI.Typo(keyword: keyword))
            .sink(receiveCompletion: { [weak self] requestCompletion in
                switch requestCompletion {
                case .finished: break
                case .failure(let error):
                    self?.errorHandling(error)
                }
            }) { (requestResult: NaverOpenAPI.Typo.Response) in
                completion(requestResult.correction)
            }
    }
    
    // MARK: Fetching Movie
    
    private var movieFetchingStream: AnyCancellable?
    
    func fetchMovies() {
        movieFetchingStream?.cancel()
        movieFetchingStream = fetcher.fetch(with: NaverOpenAPI.Movie(keyword: searchForm.keyword, genre: searchForm.genre))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] requestCompletion in
                switch requestCompletion {
                case .finished: break
                case .failure(let error):
                    self?.errorHandling(error)
                }
            }) { [weak self] (requestResult: NaverOpenAPI.Movie.Response) in
                self?.boxOffice.movies = requestResult.items.indices.map { BoxOffice.Movie(requestResult.items[$0], id: $0) }
            }
    }
    
    func cancelMovieFetchingStream() {
        movieFetchingStream = nil
    }
    
    // MARK: Deinitializer
    
    deinit {
        cancelSearchProceedableStream()
        cancelMovieFetchingStream()
    }
}

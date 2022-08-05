
import Combine

class GameManager: ObservableObject {
    var cancellables: [AnyCancellable] = []
    
    @Published var point = CurrentValueSubject<Int, Error>(0)
    @Published var tappedCard = PassthroughSubject<Int, Error>()
    @Published var currentTheme = CurrentValueSubject<ThemeModel.Detail, Error>(.face)
    @Published var tappedNextGame = PassthroughSubject<Void, Error>()
    
    var gameModel = GameModel()
    var themeModel = ThemeModel()
    
    init(){
        let calculatePoint = tappedCard
            .collect(2)
            .last()
            .filter { $0.count == 2}
            .map { openCards -> Int in
                self.gameModel.toggleCard(openCards.first ?? 0, openCards.last ?? 0)
                return self.gameModel.calculatePoint(openCards.first ?? 0, openCards.last ?? 0)
            }
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    print("Error가 발생하였습니다.")
                case .finished:
                    print("데이터의 발행이 끝났습니다.")
                }
              }, receiveValue: { value in
                  self.point.send(value)
              })

        tappedCard
            .last()
            .map { self.gameModel.toggleCard($0) }
        
        tappedNextGame
            .map { self.themeModel.changeTheme() }
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    print("Error")
                case .finished:
                    print("Success")
                }
                
            }) { value in
                self.currentTheme.send(value)
            }
            
        
        cancellables.append(calculatePoint)
    }
}

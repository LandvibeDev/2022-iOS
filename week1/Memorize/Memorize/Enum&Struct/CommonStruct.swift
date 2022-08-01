
struct CardInfo: Hashable, Identifiable {
    
    //use to be hashable this struct
    let id: String
    let image: String
    let text: String
    
    init(_ Image: String, _ Text: String, _ distinct: String = "0") { 
        self.image = Image
        self.text = Text
        self.id = Image + Text + distinct
    }
}

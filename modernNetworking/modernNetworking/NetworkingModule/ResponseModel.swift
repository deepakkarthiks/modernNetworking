
import Foundation

struct RecipePuppy: Codable {
    var title: String?
    var href: String?
    var results: [Recipe]?
    enum CodingKeys: String, CodingKey {
        case results = "results"
        case title = "title"
        case href =  "href"
    }
}
struct Recipe: Codable, Identifiable {
    var id = UUID()
    var title: String
    var ingredients: String
    var href: String
    var thumbnail: String
    enum CodingKeys: String, CodingKey {
        case title = "title", ingredients = "ingredients", href = "href", thumbnail = "thumbnail" 
    }
}


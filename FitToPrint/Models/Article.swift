
import Foundation

struct Article: Codable {
    let title: String
    let description: String?
    let urlToImage: String?
}

struct NewsResponse: Codable {
    let articles: [Article]?
}

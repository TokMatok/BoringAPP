import UIKit

protocol Fallback {
    associatedtype Value
}

struct Activity: Decodable {
    enum CodingKeys: String, CodingKey {
        case activity, accessibility, type
        case participants, price
        case link, key
    }
    
    let activity: String
    let accessibility: Double
    let type: String
    let participants: Int
    let price: Double
    
    var link: URL?
    var key: Int?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        activity = try container.decode(String.self, forKey: .activity)
        accessibility = try container.decode(Double.self, forKey: .accessibility)
        type = try container.decode(String.self, forKey: .type)
        participants = try container.decode(Int.self, forKey: .participants)
        price = try container.decode(Double.self, forKey: .price)
        
        link = try? container.decode(URL.self, forKey: .link)
        key = try? container.decode(Int.self, forKey: .key)
    }
}

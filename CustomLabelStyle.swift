import Foundation
import UIKit
enum CustomLabelStyle : CaseIterable {
    case styleRed
    case styleBlue
    case styleYellow
    case styleGray
    case styleGreen
    
    var color : UIColor {
        switch self {
        case .styleRed:
            return .init(red: 235/255, green: 87/255, blue: 87/255, alpha: 1)
        case .styleBlue:
            return .init(red: 47/255, green: 128/255, blue: 237/255, alpha: 1)
        case .styleYellow:
            return .init(red: 242/255, green: 201/255, blue: 76/255, alpha: 1)
        case .styleGray:
            return .init(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)
        case .styleGreen:
            return .init(red: 33/255, green: 150/255, blue: 83/255, alpha: 1)
        }
    }
}


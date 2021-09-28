import Foundation
import UIKit
import SnapKit

protocol SettingsViewLogic : UIView {
    
}

class SettingsView : UIView, SettingsViewLogic {
    
    private let settingsButton = SettingsButton()
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

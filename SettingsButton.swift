import UIKit
import Foundation
import SnapKit

class SettingsButton : UIButton {
    private let appearance = Appearance(); struct Appearance {
        let verticalInset: CGFloat = 28
        let horizontalMargin: CGFloat = 28
    }
    
    var tapCallback: (() -> ())?
    
    init() {
        super.init(frame: .zero)
        self.setImage(UIImage(named: "settings")!, for: .normal)
        self.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func tap(sender: UIButton) {
        self.tapCallback?()
    }
    
}

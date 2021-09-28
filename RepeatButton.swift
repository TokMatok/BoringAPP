import UIKit
import Foundation
import SnapKit

class RepeatButton : UIButton {
    private let appearance = Appearance(); struct Appearance {
        let verticalInset: CGFloat = 54
        let horizontalMargin: CGFloat = 54
    }
    
    var tapCallback: (() -> ())?
    
    init() {
        super.init(frame: .zero)
        self.setImage(UIImage(named: "repeat")!, for: .normal)
        self.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func tap() {
        self.tapCallback?()
    }
}

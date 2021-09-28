import UIKit
import SnapKit

class ShortDescriptionView: UIView {
    
    private let image = UIImageView()
    private let count = UILabel()
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 6
        stack.distribution = .fillProportionally
        
        return stack
    }()
    
    func apply(viewModel: ShortDescriptionViewModel) {
        image.image = viewModel.image
        count.text = viewModel.text
    }
    
    init() {
        super.init(frame: .zero)
        
        addSubviews()
        makeConstraints()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(stack)
        [image, count].forEach { view in
            stack.addArrangedSubview(view)
        }
    }
    
    private func makeConstraints() {
        stack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setup(){
        count.textColor = .lightGray
        image.contentMode = .scaleAspectFill
    }


}


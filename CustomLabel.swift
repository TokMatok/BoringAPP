import Foundation
import SnapKit

class CustomLabel: UIView {
    private let appearance = Appearance(); struct Appearance {
        let verticalInset: CGFloat = 12
        let horizontalMargin: CGFloat = 16
    }

    private let label = UILabel()

    init() {
        super.init(frame: .zero)
        setup()
        addSubviews()
        makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    func apply(viewModel: CustomLabelViewModel) {
        backgroundColor = viewModel.color
        label.text = viewModel.text
    }

    private func addSubviews() {
        addSubview(label)
    }

    private func makeConstraints() {
        label.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(appearance.verticalInset)
            make.leading.trailing.equalToSuperview().inset(appearance.horizontalMargin)
        }
    }

    private func setup() {
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 17)


        layer.cornerRadius = 16
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
//        layer.shadowRadius = 12
//        layer.shadowColor = UIColor.black.withAlphaComponent(0.08).cgColor
//        layer.shadowOpacity = 1
    }
}

import UIKit
import SnapKit



class DisplaysActivityView : UIView {
    
    private let label = UILabel()
    private let activityLabel = CustomLabel()
    private let priceView = ShortDescriptionView()
    private let peopleView = ShortDescriptionView()
    
    
    init(){
        super.init(frame: .zero)
        setup()
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure (viewModel : ActivityDataFlow.PresentModelData.ViewModel ) {
        let viewModel = viewModel.viewModel

        activityLabel.apply(viewModel: .init(color: viewModel.color, text: viewModel.type ))
        label.text = viewModel.activity
        priceView.apply(viewModel: .init(image: UIImage(named: "$")!, text: String(viewModel.price)))
        peopleView.apply(viewModel: .init(image: UIImage(named: "profile-287-460516 1")!, text: String(viewModel.participants)))
    }
    
    private func addSubviews() {
        addSubview(label)
        addSubview(activityLabel)
        addSubview(priceView)
        addSubview(peopleView)
    }
    
    private func makeConstraints() {
        activityLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        label.snp.makeConstraints { make in
            make.top.equalTo(activityLabel.snp.bottom).inset(-12)
            make.trailing.equalToSuperview().inset(20)
            make.leading.equalToSuperview().inset(20)
        }
        
        priceView.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).inset(-20)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(5)
        }
        peopleView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.top.equalTo(label.snp.bottom).inset(-20)
            make.bottom.equalToSuperview().inset(5)
        }
    }
    
        private func setup() {
            label.textAlignment = .center
            label.numberOfLines = 0
            label.font = .systemFont(ofSize: 35)
            label.textColor = .black
            label.setContentHuggingPriority(.required, for: .vertical)
            activityLabel.setContentCompressionResistancePriority(.required, for: .vertical)
            label.minimumScaleFactor = 0.5
            label.adjustsFontSizeToFitWidth = true
            layer.cornerRadius = 16
            layer.shadowRadius = 8
            layer.shadowOffset = .zero
            layer.shadowOpacity = 0.3
            backgroundColor = .white
        }
    
}

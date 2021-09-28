import UIKit
import SnapKit

protocol ActivityViewLogic: UIView {
    func configure (viewModel : ActivityDataFlow.PresentModelData.ViewModel )
    var settingsTapped: (() -> ())? { get set }
    var repeatTapped : (() -> ())? { get set }
}

class MainLabelView : UIView, ActivityViewLogic {
    
    private let settingsButton = SettingsButton()
    private let displaysActivityView = DisplaysActivityView()
    private let repeatButton = RepeatButton()
    
    var settingsTapped : (() -> ())? {
        willSet {
            settingsButton.tapCallback = newValue
        }
    }
    
    var repeatTapped : (() -> ())? {
        willSet {
            repeatButton.tapCallback = newValue
        }
    }
    
    
    init() {
        super.init(frame: .zero)
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(settingsButton)
        addSubview(displaysActivityView)
        addSubview(repeatButton)
    }
    
    private func makeConstraints() {
        settingsButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(10)
        }
        displaysActivityView.snp.makeConstraints { make in
            make.top.equalTo(settingsButton.snp.bottom).inset(-125)
            make.trailing.equalToSuperview().inset(30)
            make.leading.equalToSuperview().inset(30)
        }
        repeatButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(30)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    func configure (viewModel : ActivityDataFlow.PresentModelData.ViewModel ){
        displaysActivityView.configure(viewModel: viewModel)
    }
    
}


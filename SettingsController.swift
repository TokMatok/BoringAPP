import UIKit

class SettingsController : UIViewController {
    let interactor: SettingsInteractor
    let initialState : SettingsDataFlow.ViewControllerState?
    init(interactor: SettingsInteractor, initialState : SettingsDataFlow.ViewControllerState? ) {

        self.interactor = interactor
        self.initialState = initialState
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

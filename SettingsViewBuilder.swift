import UIKit

class SettingsViewBuilder : ModuleBuilder {
    var initialState : SettingsDataFlow.ViewControllerState?
    func set(initialState: SettingsDataFlow.ViewControllerState) -> SettingsViewBuilder {
        self.initialState = initialState
        return self
    }
    func build() -> UIViewController {
        guard let initialState = initialState else {
            fatalError("Initial State parametr was not set")
        }
        let presenter =  SettingsPresenter()
        let interactor = SettingsInteractor(presenter: presenter)
        let controller = SettingsController(interactor: interactor, initialState: initialState)
        
       presenter.viewController = controller
       return controller
    }
}

import UIKit

class Interactor {
    let provider: ProvidesActivity
    let presenter: PresentationLogic
    init(provider : Provider, presenter : Presenter) {
        self.provider = provider
        self.presenter = presenter
    }
    
    public func getActivity() {
        provider.getActivity { [weak self] (result) in
            switch result{
            case .success(let activity) :
                self?.presenter.presentSuccess(activity: .init(response: activity))
            case .failure(let error) :
                self?.presenter.presentFail(fail: error)
            
            }
        }
    }
    public func refreshData() {
        getActivity()
    }
    
    public func showSettings() {
        presenter.presentSettings()
        
    }
    func getRequestToProvider() {
        
    }
}

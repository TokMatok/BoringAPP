import UIKit

protocol PresentationLogic : AnyObject {
    func presentSuccess(activity: ActivityDataFlow.PresentModelData.Response)
    func presentFail(fail: Error)
    func presentSettings()
    
}

class Presenter : PresentationLogic {
    
    weak var viewController: ActivityDisplayLogic?
    
    func presentSuccess(activity: ActivityDataFlow.PresentModelData.Response) {
        viewController?.displaySucsess(
            activity: .init(
                viewModel: .init(
                    activity: activity.response.activity,
                    accessibility: activity.response.accessibility,
                    type: activity.response.type,
                    participants: activity.response.participants,
                    price: activity.response.price)
            )
        )
    }
    
    func presentFail(fail: Error) {
        viewController?.displayFail(error: fail)
    }
    
    func presentSettings() {
        
    }
}


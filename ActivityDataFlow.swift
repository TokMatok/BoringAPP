import UIKit

enum ActivityDataFlow {
    enum PresentModelData {
        struct Request { }
        
        struct Response {
            let response: Activity
        }
        
        struct ViewModel {
            let viewModel: ActivityViewModel
        }
        
    }
    
}

import UIKit

enum SettingsDataFlow {
    enum PresentModelData {
        struct Request { }
        
        struct Response {
            let response: Activity
        }
        
        struct ViewModel {
            let viewModel: SettingsViewModel
        }
        
    }
    
}

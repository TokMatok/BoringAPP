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
    enum ViewControllerState {
            case initial(id: UniqueIdentifier)
            case loading
            case result(snapshotViewModel: SettingsViewModel, infoRepresentable: [SettingsViewModel])
            case emptyResult(id: UniqueIdentifier)
            case error(id: UniqueIdentifier, message: String)
        }
}

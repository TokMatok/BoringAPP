import UIKit

protocol SettingsPresenterLogic {
    //func presentFetchedDetails(response: CatalogDetails.ShowDetails.Response)
   // func presentOpenExternalLink(response: CatalogDetails.OpenExternalLink.Response)
}

class SettingsPresenter : SettingsPresenterLogic {
    
    weak var viewController:  SettingsDisplayLogic?
//
       
//
//       init(viewController: SettingsDisplayLogic) {
//           self.viewController = viewController
//
//       }
//
//        // MARK: Present Fetched Details
//        func presentFetchedDetails(response: CatalogDetails.ShowDetails.Response) {
//            var viewModel: CatalogDetails.ShowDetails.ViewModel
//
//            switch response.result {
//            case let .success(model, imageData):
//                let coinSnapshotViewModel = makeCoinSnapshotViewModel(model, imageData: imageData)
//                viewModel = CatalogDetails.ShowDetails.ViewModel(coinId: model.uid, error: nil, snapshotViewModel: coinSnapshotViewModel, infoRepresentable: coinSnapshotViewModel.properties)
//            case let .failure(id, error):
//                viewModel = CatalogDetails.ShowDetails.ViewModel(coinId: id, error: error, snapshotViewModel: nil, infoRepresentable: nil)
//            }
//            viewController?.displayFetchedDetails(viewModel: viewModel)
        }

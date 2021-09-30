import UIKit

protocol ProvidesActivity: AnyObject {
    func getActivity(completion: @escaping (Result<Activity, Error>) -> Void)
}

protocol ActivityDataStoreLogic : AnyObject {
    
}

class Provider : ProvidesActivity {
    let networkSerive = ActivityNetworkService()
    
    var activityDataStore = ActivityDataStore()
    
    func getActivity (completion: @escaping (Result<Activity, Error>) -> Void) {
        networkSerive.sendRequest { [weak self] result in
            switch result {
            case .success(let activity):
                self?.activityDataStore.makeInStoredData(activity: activity)
            case .failure:
                break
            }
            DispatchQueue.main.async {
                completion(result)
               
            }
        }
    }
    
    
}
class ActivityDataStore : ActivityDataStoreLogic {
    var storedData = [Activity]()
    func makeInStoredData (activity : Activity) {
        storedData.append(activity)
    }
    func makeOutStoredData() -> [Activity] {
        
        let outData = storedData
        return outData
    }
}

//
//  ViewController.swift
//  BoringAPI
//
//  Created by Ярослав on 23.09.2021.
//

import UIKit

protocol ActivityDisplayLogic: AnyObject {
    func displaySucsess(activity: ActivityDataFlow.PresentModelData.ViewModel)
    func displayFail(error : Error)
}
protocol MainLabelViewControllerDelegate : class {
    func openSettingsView()
}

class MainLabelViewController: UIViewController, ActivityDisplayLogic {
    
    /*extension MainLabelViewController : MainLabelViewControllerDelegate {
        func openSettingsView() {
          //  let settingsController =
        }
    }*/
    
    lazy var contentView: ActivityViewLogic = {
        let view = MainLabelView()
        
        view.repeatTapped = {
            self.interactor.refreshData()
        }
        
        view.settingsTapped = {
            self.interactor.showSettings()
        }
        
        return view
    }()
    
    let interactor: Interactor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
        interactor.getActivity()
    }
    
    func displaySucsess(activity: ActivityDataFlow.PresentModelData.ViewModel) {
        contentView.configure(viewModel: activity)
    }
    
    func displayFail(error : Error) {
        let pleaseAssessAlert = UIAlertController(title: "Alert!", message: error.localizedDescription, preferredStyle: .alert)
        
        let okButtonOnAlertAction = UIAlertAction(title: "Done", style: .default)
        
        pleaseAssessAlert.addAction(okButtonOnAlertAction)
        self.present(pleaseAssessAlert, animated: true, completion: nil)
    }
    
    init(interactor : Interactor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


//
//  MedicationsRouter.swift
//  VIPERDemo
//
//  Created by Mustafa Ahmed on 14/09/2022.
//

import Foundation
import UIKit
class MedicationRouter {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(MedicationViewController.self)") as! MedicationViewController
        let interactor = MedicationsInteractor()
        let router = MedicationRouter()
        let presenter = MedicationsPresenter(view: view, interactorInput: interactor)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
}

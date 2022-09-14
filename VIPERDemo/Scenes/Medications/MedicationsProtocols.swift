//
//  MedicationsProtocols.swift
//  VIPERDemo
//
//  Created by Mustafa Ahmed on 12/09/2022.
//

import Foundation

protocol MedicationsViewProtocal {
    func showIndicator()
    func hideIndicator()
    func viewReload() 
}
protocol MedicationsPresenterProtocal {
    func getMedications()
    func configure(cell:MedicineSearchTableViewCell,indexPath:IndexPath)
    func drugCount() -> Int
}
protocol MedicationsInteractorInputProtocal {
    
    func getMedications()
}
protocol MedicationsInteractorOutputProtocal:class {
    func medicationsFetchedSuccessfully(model:SearchResponseModel)
    func medicationsFetchingFailed(withError error: Error)
    
}
protocol MedicationViewModel {
    func configure(viewModel:drugViewModel)
}

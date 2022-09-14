//
//  MedicationsPresenter.swift
//  VIPERDemo
//
//  Created by Mustafa Ahmed on 12/09/2022.
//

import Foundation

class MedicationsPresenter:MedicationsInteractorOutputProtocal, MedicationsPresenterProtocal {
   
    
    var view:MedicationsViewProtocal?
    var interactorOutput:MedicationsInteractorOutputProtocal?
    var interactorInput:MedicationsInteractorInputProtocal?
    var searchObject:SearchResponseModel?
    init(view:MedicationsViewProtocal,interactorInput:MedicationsInteractorInputProtocal) {
        self.view = view
        self.interactorInput = interactorInput
    }
    func getMedications() {
        self.view?.showIndicator()
        self.interactorInput?.getMedications()
    }
    func medicationsFetchedSuccessfully(model:SearchResponseModel) {
        self.searchObject = model
        view?.viewReload()
    }
    func medicationsFetchingFailed(withError error: Error) {
        
    }
    
    func configure(cell: MedicineSearchTableViewCell, indexPath: IndexPath) {
        let model = searchObject?.complaints?[indexPath.row]
        let viewModel = drugViewModel(drug: model!)
        cell.configure(viewModel: viewModel)
    }
    func drugCount() -> Int {
        return  searchObject?.complaints?.count ?? 0
         
    }

    
}

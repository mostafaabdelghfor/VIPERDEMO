//
//  MedicationsInteractor.swift
//  VIPERDemo
//
//  Created by Mustafa Ahmed on 12/09/2022.
//

import Foundation

class  MedicationsInteractor :MedicationsInteractorInputProtocal{
    weak var presenter: MedicationsInteractorOutputProtocal?

   
    let params = ["indexFrom": "0", "IndexTo": "20", "GroupCode": "4", "serchKey": ""]
    let header = ["Authorization": "Bearer FSUXMMUJ3glndfLlem3kzpfrjD2AAGU3ZcCY-dE9yFqOwQhvu_45X5lcS-qwlZ_PykWg3HVFf3y2bo1iuEIkDYt9N_EqStcTIobjnnH67jWavPjqHBLF-KcdMRshsaZYmYnjgO_OexwNhFY075WRKTIQ1c9OcPXwLK_34mFBxGgjQ7J5sOyxPTXp2A9jJjGLACd2WpEi2cbsuMugXo8S5aNyHb5I61K-Rakv7W5BQKTlZpaN18SSZ2xUL655OTjI7IVLRSIfWZDPEUpApPY970cxeO1OTW0RFIEr8n2S20Ty3XOXS2F4yMqq88TkgqcJbs0B_M-N1_nVj7WXR4rXJjXnQcEIccK6TtaMkTuAwJVG5cUymrTAHP9rVvKSeYvai48EllnvHWmy1mGWBKCSpZmfn6J6paM_kd5kVMrVgqs9uoJOkomcUfxzgpY4m0fxdiRYavhYQ803e2wN_RBOoBv6xlgvRHmY23EeCwfCfUkNJqsvGxAi1OyCtrimJpw4"]
    
    func getMedications() {
        AppConnectionsHandler.raw(url: "http://40.127.194.127:5656//Salamtak/GetMedicationItems", params: params, headers: header, type: SearchResponseModel.self) { (status, model, error) in
            switch status {
            case .sucess:
             let modelSearch = model as? SearchResponseModel
                self.presenter?.medicationsFetchedSuccessfully(model: modelSearch!)
            case .error :
                self.presenter?.medicationsFetchingFailed(withError: error as! Error)
            }
        }
        
    }

}


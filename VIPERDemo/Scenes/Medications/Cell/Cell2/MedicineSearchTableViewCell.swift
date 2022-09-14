

import UIKit
import MOLH

class MedicineSearchTableViewCell: UITableViewCell ,MedicationViewModel{
   
    

    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var imageViewMedicine: UIImageView!
    @IBOutlet weak var viewAddToCart: UIView!
    @IBOutlet weak var viewInCart: UIView!
    @IBOutlet weak var viewQty: UIView!
    @IBOutlet weak var labelQty: UILabel!
    @IBOutlet weak var imageViewPlus: UIImageView!
    @IBOutlet weak var imageViewMinus: UIImageView!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelOldPrice: UILabel!
    @IBOutlet weak var labelName: UILabel!

    
    
    var index = 0
 
    var arrayCart = [MedicineModel]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewQty.layer.cornerRadius = 10
     
    }
    
    func configure(viewModel: drugViewModel) {
        labelPrice.text = viewModel.drugPrice
        labelName.text = viewModel.drugName

    }


}

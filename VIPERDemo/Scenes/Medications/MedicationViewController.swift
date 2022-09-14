//
//  MedicationViewController.swift
//  VIPERDemo
//
//  Created by Mustafa Ahmed on 12/09/2022.
//

import UIKit

class MedicationViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter:MedicationsPresenterProtocal?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter?.getMedications()
    }
    func setupTableView() {
        tableView.register("MedicineSearchTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
   

}
extension MedicationViewController:MedicationsViewProtocal{
    
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    func viewReload() {
        tableView.reloadData()
    }

}
extension MedicationViewController:UITableViewDelegate,UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return presenter!.drugCount()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MedicineSearchTableViewCell") as! MedicineSearchTableViewCell
        presenter?.configure(cell: cell, indexPath: indexPath)
        return cell
    }
}
extension UITableView {
    
    func register(_ nibName: String) {
        let nib = UINib(nibName: nibName, bundle: nil)
        self.register(nib, forCellReuseIdentifier: nibName)
    }
    
    func registerWithAutomaticHeight(_ nibName: String) {
        let nib = UINib(nibName: nibName, bundle: nil)
        self.register(nib, forCellReuseIdentifier: nibName)
        self.rowHeight = UITableView.automaticDimension
    }
    
    func register(_ cell: UITableViewCell.Type) {
        let nibName = String(describing: cell.self)
        self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
    }
    
    func registerWithAutomaticHeight(_ cell: UITableViewCell.Type) {
        let nibName = String(describing: cell.self)
        self.register(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: nibName)
        self.rowHeight = UITableView.automaticDimension
    }
    
    func dequeue<Cell: UITableViewCell>() -> Cell {
        let nibName = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: nibName) as? Cell else {
            fatalError("Error in cell")
        }
        return cell
    }
}

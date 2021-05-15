//
//  DreamViewController.swift
//  MyMoneeProject
//
//  Created by MacBook on 13/05/21.
//

import UIKit

class DreamViewController: UIViewController{
    
    @IBOutlet weak var dreamHistoryTable: UITableView!
    @IBOutlet weak var addDream: UIButton!
    
    var progress: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dreamHistoryTable.delegate = self
        dreamHistoryTable.dataSource = self
        dreamHistoryTable.separatorStyle = .none
        dreamHistoryTable.backgroundColor = .none
        
        let uiNib = UINib(nibName: String(describing: DreamTableViewCell.self), bundle: nil)
        dreamHistoryTable.register(uiNib, forCellReuseIdentifier: String(describing: DreamTableViewCell.self))
    }
    
    @IBAction func addDream(_ sender: Any) {
        let addDreamViewController = AddDreamViewController(nibName: "AddDreamViewController", bundle: nil)
        addDreamViewController.modalPresentationStyle = .fullScreen
        present(addDreamViewController, animated: true, completion: nil)
    }

}


extension DreamViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dream.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dreamHistoryTable.dequeueReusableCell(withIdentifier: String(describing: DreamTableViewCell.self), for: indexPath) as! DreamTableViewCell
        cell.dreamTitle.text = dream[indexPath.row].dreamTitle
        cell.dreamCurrentAmount.text = setAmountString(amountValue: dream[indexPath.row].dreamCurrentAmount ?? 0)
        cell.dreamTargetAmount.text = setAmountString(amountValue: dream[indexPath.row].dreamTargetAmount ?? 0)
        
        let currentAmount = setDecimalToDouble(value: dream[indexPath.row].dreamCurrentAmount ?? 0)
        let targetAmount = setDecimalToDouble(value: dream[indexPath.row].dreamTargetAmount ?? 0)
        
        self.progress = Float(currentAmount/targetAmount)
        
        cell.progress.progress = progress
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: false)
        let dreamDetailViewController = DreamDetailViewController(nibName: "DreamDetailViewController", bundle: nil)
        
        dreamDetailViewController.modalPresentationStyle = .fullScreen
        dreamDetailViewController.modalTransitionStyle = .coverVertical
        
        dreamDetailViewController.passIndex = indexPath.row
        dreamDetailViewController.passDreamTitle = dream[indexPath.row].dreamTitle ?? ""
        dreamDetailViewController.passCurrentAmount = dream[indexPath.row].dreamCurrentAmount ?? 0
        dreamDetailViewController.passTargetAmount = dream[indexPath.row].dreamTargetAmount ?? 0
        
        dreamDetailViewController.passProgress = self.progress
        
        self.present(dreamDetailViewController, animated: true, completion: nil)
    }
}

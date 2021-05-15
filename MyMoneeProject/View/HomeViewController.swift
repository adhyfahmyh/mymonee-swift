//
//  HomeViewController.swift
//  MyMoneeProject
//
//  Created by MacBook on 13/05/21.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var usageHistoryTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usageHistoryTable.delegate = self
        usageHistoryTable.dataSource = self
        usageHistoryTable.separatorStyle = .none
        
        let uiNib = UINib(nibName: String(describing: HomeTableViewCell.self), bundle: nil)
        usageHistoryTable.register(uiNib, forCellReuseIdentifier: String(describing: HomeTableViewCell.self))
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moneyUsage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = usageHistoryTable.dequeueReusableCell(withIdentifier: String(describing: HomeTableViewCell.self), for: indexPath) as! HomeTableViewCell
        cell.usageTitle.text = moneyUsage[indexPath.row].usageTitle
        cell.date.text = moneyUsage[indexPath.row].date
        cell.usageAmount.text = moneyUsage[indexPath.row].usageAmount
        if moneyUsage[indexPath.row].status {
            cell.icon.image = UIImage(named: "arrow_down_box")
            cell.usageAmount.textColor = .red
        } else {
            cell.icon.image = UIImage(named: "arrow_up_box")
            cell.usageAmount.textColor = .green
        }
        
        return cell
    }
    
    
    @IBAction func addUsage(_ sender: Any) {
        let addUsageViewController = AddUsageViewController(nibName: "AddUsageViewController", bundle: nil)
        addUsageViewController.modalPresentationStyle = .fullScreen
        present(addUsageViewController, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

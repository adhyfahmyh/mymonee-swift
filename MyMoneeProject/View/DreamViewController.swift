//
//  DreamViewController.swift
//  MyMoneeProject
//
//  Created by MacBook on 13/05/21.
//

import UIKit

protocol DreamProtocol: AnyObject {
    func deleteConfirm(with dreamId: Int)
    func confirm(with dreamId: Int)
//    func modifiedData(id: Int, dreamTitle: String, dreamAmount: Decimal)
}

class DreamViewController: UIViewController{
    
    @IBOutlet weak var dreamHistoryTable: UITableView!
    @IBOutlet weak var addDream: UIButton!
    @IBOutlet weak var notFoundView: NotFoundView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        notFoundView.isHidden = true
        dreamHistoryTable.delegate = self
        dreamHistoryTable.dataSource = self
        dreamHistoryTable.separatorStyle = .none
        dreamHistoryTable.backgroundColor = .none

        let uiNib = UINib(nibName: String(describing: DreamTableViewCell.self), bundle: nil)
        dreamHistoryTable.register(uiNib, forCellReuseIdentifier: String(describing: DreamTableViewCell.self))

        dreamHistoryTable.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dreamHistoryTable.reloadData()
    }
    
    @IBAction func addDream(_ sender: Any) {
        let addDreamViewController = AddDreamViewController(nibName: "AddDreamViewController", bundle: nil)
        addDreamViewController.modalPresentationStyle = .fullScreen
        present(addDreamViewController, animated: true, completion: nil)
    }

}


extension DreamViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if dream.count > 0 {
            self.dreamHistoryTable.isHidden = false
            self.notFoundView.isHidden = true
            return dream.count
        } else {
            notFoundView.addUsageBtn.setTitle("Buat Impian", for: .normal)
            notFoundView.addUsageBtn.addTarget(self, action: #selector(self.addDream(_:)), for: .touchUpInside)
            self.dreamHistoryTable.isHidden = true
            self.notFoundView.isHidden = false
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dreamHistoryTable.dequeueReusableCell(withIdentifier: String(describing: DreamTableViewCell.self), for: indexPath) as! DreamTableViewCell

        cell.dreamTitle.text = "\(dream[indexPath.row].dreamTitle) "
//        cell.balance.text = convert.setAmountString(amountValue: users[0].balance ?? 0)
//        cell.dreamAmount.text = convert.setAmountString(amountValue: dream[indexPath.row].dreamAmount )
        cell.balance.text = users[0].balance?.setAmountString
        cell.dreamAmount.text = dream[indexPath.row].dreamAmount.setAmountString
        
        
        if progressResult(indexPath) >= 1 {
            cell.confirmButton.setImage(UIImage(named: "achieved_icon"), for: .normal)
            cell.confirmButton.isEnabled = true
        } else {
//            cell.confirmationImg.image = UIImage(named: "unachieved_icon")
            cell.confirmButton.setImage(UIImage(named: "unachieved_icon"), for: .normal)
            cell.confirmButton.isEnabled = false
        }

        cell.progress.progress = progressResult(indexPath)
        
        cell.delegate = self
        cell.dreamId = indexPath.row
        cell.title = dream[indexPath.row].dreamTitle
        cell.amount = dream[indexPath.row].dreamAmount

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dreamDetailViewController = DreamDetailViewController(nibName: "DreamDetailViewController", bundle: nil)

        dreamDetailViewController.modalPresentationStyle = .fullScreen
        dreamDetailViewController.modalTransitionStyle = .coverVertical

        dreamDetailViewController.passIndex = indexPath.row
        dreamDetailViewController.passProgress = progressResult(indexPath)

        present(dreamDetailViewController, animated: true, completion: nil)
    }

}


extension DreamViewController: DreamProtocol {
    
//    func modifiedData(id: Int, dreamTitle: String, dreamAmount: Decimal) {
//        print("dreamTitle")
//        dream.append(Dream(id: id, dreamTitle: dreamTitle, dreamAmount: dreamAmount))
//        self.dreamHistoryTable.reloadData()
//    }
    func confirm(with dreamId: Int) {
        let confirmAlert = UIAlertController(title: "Selamat", message: "Impian \"\(dream[dreamId].dreamTitle )\" Anda berhasil tercapai! \nTambahkan Penggunaan?", preferredStyle: .alert)
        
        let confirm = UIAlertAction(title: "OK", style: .default) { (_) -> Void in
            moneyUsage.append(MoneyUsage(id: (moneyUsage.endIndex)+1, status: .moneyOut, usageTitle: "Impian \(dream[dreamId].dreamTitle)", date: Date().dateTime, usageAmount: dream[dreamId].dreamAmount))
            
            confirmationStatus.append(ConfirmationStatus(dreamId: dreamId))
            
            wallets[0].totalMoneyOut! += dream[dreamId].dreamAmount
            users[0].balance = ((wallets[0].totalMoneyIn!)-(wallets[0].totalMoneyOut!))
            
            dream.remove(at: dreamId)
            self.dreamHistoryTable.reloadData()
        }
        
        let cancel = UIAlertAction(title: "Batal", style: .cancel)
        
        confirmAlert.addAction(confirm)
        confirmAlert.addAction(cancel)
        
        present(confirmAlert, animated: true, completion: nil)
        
    }
    func deleteConfirm(with dreamId: Int) {
        let alert = UIAlertController(title: "Menghapus Impian", message: "Apakah anda yakin menghapus '\(dreamId)'", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Batal", style: .cancel))
        alert.addAction(UIAlertAction(title: "Hapus", style: .destructive){ (_) -> Void in
            dream.remove(at: dreamId)
            self.dreamHistoryTable.reloadData()
        })
        
        present(alert, animated: true)
    }
    
    fileprivate func progressResult(_ indexPath: IndexPath) -> Float {
//        let currentAmount = convert.setDecimalToDouble(value: users[0].balance ?? 0)
//        let targetAmount = convert.setDecimalToDouble(value: dream[indexPath.row].dreamAmount )
        let currentAmount = users[0].balance?.setDecimalToDouble ?? 0
        let targetAmount = dream[indexPath.row].dreamAmount.setDecimalToDouble

        let progress = Float(currentAmount/targetAmount)
        return progress
    }
}

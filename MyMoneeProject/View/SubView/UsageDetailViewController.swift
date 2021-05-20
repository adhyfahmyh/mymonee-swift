//
//  UsageDetailViewController.swift
//  MyMoneeProject
//
//  Created by MacBook on 15/05/21.
//

import UIKit

class UsageDetailViewController: UIViewController {

    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var usageImg: UIImageView!
    @IBOutlet weak var usageTitle: UILabel!
    @IBOutlet weak var usageTypeLbl: UILabel!
    @IBOutlet weak var usageAmount: UILabel!
    @IBOutlet weak var usageId: UILabel!
    @IBOutlet weak var usageDate: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    
    var passIndex: Int? = nil
//    var moneyUsage: [MoneyUsage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        componentConfig()
        receiveData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        componentConfig()
        receiveData()
    }

    @IBAction func editUsage(_ sender: UIButton) {
        let editUsageViewController = EditUsageViewController(nibName: "EditUsageViewController", bundle: nil)
        editUsageViewController.modalPresentationStyle = .fullScreen
        editUsageViewController.modalTransitionStyle = .coverVertical
        
        editUsageViewController.passIndex = passIndex
        
        present(editUsageViewController, animated: true, completion: nil)
//        navigationController?.pushViewController(editUsageViewController, animated: true)
    }
    
    @IBAction func backToHome(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension UsageDetailViewController: updateDataHome {
    
    func update(id: Int, status: moneyStatus, usageTitle: String, date: String, usageAmount: Decimal) {
        print("test update function")
        moneyUsage[passIndex!] = MoneyUsage(id: id, status: status , usageTitle: usageTitle, date: date, usageAmount: usageAmount )
        receiveData()
    }
    
    fileprivate func componentConfig() {
        
        backBtn.layer.cornerRadius = 20
        backBtn.layer.borderWidth = 3.0
        backBtn.layer.borderColor = Colors.mainBlue.cgColor
        
        usageImg.layer.backgroundColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
        
    }
    
    fileprivate func receiveData() {
        
//        if moneyUsage.isEmpty == false {
//            usageTitle.text = moneyUsage[passIndex!].usageTitle
//            usageDate.text = moneyUsage[passIndex!].date
//            usageId.text = "MM - \(moneyUsage[passIndex!].id!)"
//
//            if (moneyUsage[passIndex!].status == moneyStatus.moneyIn) {
//                usageImg.image = UIImage(named: "arrow_up_box")
////                usageAmount.text = "+\(convert.setAmountString(amountValue: moneyUsage[passIndex!].usageAmount ?? 0))"
//                usageAmount.text = "+\(moneyUsage[passIndex!].usageAmount?.setAmountString ?? "")"
//                usageAmount.textColor = Colors.mainGreen
//                usageTypeLbl.text = "Pemasukan"
//            } else {
//                usageImg.image = UIImage(named: "arrow_down_box")
////                usageAmount.text = "-\(convert.setAmountString(amountValue: moneyUsage[passIndex!].usageAmount ?? 0))"
//                usageAmount.text = "-\(moneyUsage[passIndex!].usageAmount?.setAmountString ?? "")"
//                usageAmount.textColor = Colors.mainRed
//                usageTypeLbl.text = "Pengeluaran"
//            }
//        }
        if transaction.isEmpty == false {
            usageTitle.text = transaction[passIndex!].usageTitle
            usageDate.text = transaction[passIndex!].date
            usageId.text = "MM - \(transaction[passIndex!].id!)"
            
            if (transaction[passIndex!].status == "pemasukan") {
                usageImg.image = UIImage(named: "arrow_up_box")
                usageAmount.text = "+\(transaction[passIndex!].usageAmount?.setAmountString ?? "")"
                usageAmount.textColor = Colors.mainGreen
                usageTypeLbl.text = "Pemasukan"
            } else {
                usageImg.image = UIImage(named: "arrow_down_box")
                usageAmount.text = "-\(transaction[passIndex!].usageAmount?.setAmountString ?? "")"
                usageAmount.textColor = Colors.mainRed
                usageTypeLbl.text = "Pengeluaran"
            }
        }
        
    }
}


//
//  DreamDetailViewController.swift
//  MyMoneeProject
//
//  Created by MacBook on 14/05/21.
//

import UIKit

class DreamDetailViewController: UIViewController {

    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var dreamTitle: UILabel!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var percentage: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var currentAmount: UILabel!
    @IBOutlet weak var targetAmount: UILabel!
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var progressView: UIView!
    
    var passIndex: Int? = nil
    var passProgress: Float? = 0
    var convert = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passProgress ?? 0 >= 1 ? enabledBtn(confirmBtn) : disabledBtn(confirmBtn)
        componentConfig()
        receiveData()
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        passProgress ?? 0 >= 1 ? enabledBtn(confirmBtn) : disabledBtn(confirmBtn)
        componentConfig()
        receiveData()
    }

    @IBAction func editBtn(_ sender: UIButton) {
        let editDreamViewController = EditDreamViewController(nibName: "EditDreamViewController", bundle: nil)
        editDreamViewController.passIndex = passIndex
        editDreamViewController.modalPresentationStyle = .fullScreen
        present(editDreamViewController, animated: true, completion: nil)
    }

    @IBAction func backToHome(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func dreamAchieved(_ sender: UIButton) {
        
        let confirmAlert = UIAlertController(title: "Selamat", message: "Impian \"\(dream[passIndex ?? 0].dreamTitle )\" Anda berhasil tercapai! \nTambahkan Penggunaan?", preferredStyle: .alert)
        
        let confirm = UIAlertAction(title: "OK", style: .default) { [self] (_) -> Void in
            
            moneyUsage.append(MoneyUsage(id: (moneyUsage.endIndex)+1, status: .moneyOut, usageTitle: "Impian \(dream[passIndex!].dreamTitle)", date: Date().dateTime, usageAmount: dream[passIndex!].dreamAmount))
            
            confirmationStatus.append(ConfirmationStatus(dreamId: passIndex!))
            
            wallets[0].totalMoneyOut! += dream[passIndex!].dreamAmount
            users[0].balance = ((wallets[0].totalMoneyIn!)-(wallets[0].totalMoneyOut!))
            
            dream.remove(at: passIndex!)
            
            self.dismiss(animated: true, completion: nil)
        }
        
        let cancel = UIAlertAction(title: "Batal", style: .cancel)
        
        confirmAlert.addAction(confirm)
        confirmAlert.addAction(cancel)
        
        present(confirmAlert, animated: true, completion: nil)
    }
}

extension DreamDetailViewController {
    
    fileprivate func componentConfig() {
        
        progressView.layer.shadowColor = UIColor.black.cgColor
        progressView.layer.shadowOpacity = 0.3
        progressView.layer.shadowOffset = CGSize(width: 0, height: 2)
        progressView.layer.cornerRadius = 10
        
        confirmBtn.layer.cornerRadius = 20
        
        backBtn.layer.cornerRadius = 20
        backBtn.layer.borderWidth = 3.0
        backBtn.layer.borderColor = Colors.mainBlue.cgColor
        
    }
    
    fileprivate func receiveData() {
        
        if dream.isEmpty == false {
            passProgress = (passProgress ?? 0 > 1) ? 1 : passProgress
            dreamTitle.text = dream[passIndex ?? 0].dreamTitle
//            currentAmount.text = convert.setAmountString(amountValue: users[0].balance ?? 0)
//            targetAmount.text = convert.setAmountString(amountValue: dream[passIndex ?? 0].dreamAmount)
            
            currentAmount.text = users[0].balance?.setAmountString ?? ""
            targetAmount.text = dream[passIndex ?? 0].dreamAmount.setAmountString
            
            progress.progress = passProgress ?? 0
            percentage.text = "\(Int(Float(passProgress ?? 0)*100))%"
//            balance.text = "Rp. \(convert.setDecimalToString(amountValue: users[0].balance ?? 0))"
            balance.text = "Rp. \(users[0].balance?.setAmountString ?? "")"
        }
    }
    
}

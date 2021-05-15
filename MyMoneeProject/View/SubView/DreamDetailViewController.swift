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
    
    let mainBlue = UIColor(red: 80.0/255.0, green: 105.0/255.0, blue: 184.0/255.0, alpha: 1.0)
    
    var passIndex: Int? = nil
    var passDreamTitle: String = ""
    var passBalance: String = ""
    var passCurrentAmount: Decimal = 0
    var passTargetAmount: Decimal = 0
    var passProgress: Float? = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(passProgress ?? 0)
        componentConfig()
        passData()
    
    }

    @IBAction func editBtn(_ sender: UIButton) {
        let editDreamViewController = EditDreamViewController(nibName: "EditDreamViewController", bundle: nil)
        editDreamViewController.passIndex = passIndex
        editDreamViewController.passDreamTitle = passDreamTitle
        editDreamViewController.passCurrentAmount = passCurrentAmount
        editDreamViewController.passTargetAmount = passTargetAmount
        editDreamViewController.modalPresentationStyle = .fullScreen
        present(editDreamViewController, animated: true, completion: nil)
    }

    @IBAction func BackToHome(_ sender: UIButton) {
        let mainTabController = MainTabController(nibName: "MainTabController", bundle: nil)
        mainTabController.modalPresentationStyle = .fullScreen
        mainTabController.selectedIndex = 1
        present(mainTabController, animated: false, completion: nil)
    }
}

extension DreamDetailViewController {
    
    fileprivate func componentConfig() {
        
        progressView.layer.shadowColor = UIColor.black.cgColor
        progressView.layer.shadowOpacity = 0.3
        progressView.layer.shadowOffset = CGSize(width: 0, height: 2)
        progressView.layer.cornerRadius = 10
        
        confirmBtn.layer.cornerRadius = 20
        confirmBtn.layer.backgroundColor = mainBlue.cgColor
        
        backBtn.layer.cornerRadius = 20
        backBtn.layer.borderWidth = 3.0
        backBtn.layer.borderColor = mainBlue.cgColor
        
    }
    
    fileprivate func passData(){
        
        dreamTitle.text = passDreamTitle
        currentAmount.text = setAmountString(amountValue: passCurrentAmount)
        targetAmount.text = setAmountString(amountValue: passTargetAmount)
        progress.progress = passProgress ?? 0
        
    }
}

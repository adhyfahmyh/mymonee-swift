//
//  EditDreamViewController.swift
//  MyMoneeProject
//
//  Created by MacBook on 14/05/21.
//

import UIKit

class EditDreamViewController: UIViewController {

    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var dreamTitle: UILabel!
    @IBOutlet weak var dreamAmount: UILabel!
    @IBOutlet weak var fieldDreamTitle: UITextField!
    @IBOutlet weak var fieldCurrentAmount: UITextField!
    @IBOutlet weak var fieldTargetAmount: UITextField!
    
    
    let mainRed = UIColor(red: 235.0/255.0, green: 87.0/255.0, blue: 87.0/255.0, alpha: 1.0)
    
    var passIndex: Int? = nil
    var passDreamTitle = ""
    var passCurrentAmount: Decimal = 0
    var passTargetAmount: Decimal = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        deleteBtn.layer.cornerRadius = 20
        deleteBtn.layer.borderWidth = 3.0
        deleteBtn.layer.borderColor = mainRed.cgColor
        
        fieldDreamTitle.text = passDreamTitle
        fieldCurrentAmount.text = setAmountString(amountValue: passCurrentAmount).replacingOccurrences(of: ".", with: "")
        fieldTargetAmount.text = setAmountString(amountValue: passTargetAmount).replacingOccurrences(of: ".", with: "")
        
    }

    @IBAction func backBtn(_ sender: UITapGestureRecognizer) {
        let dreamDetailViewController = DreamDetailViewController(nibName: "DreamDetailViewController", bundle: nil)
        dreamDetailViewController.modalPresentationStyle = .fullScreen
        present(dreamDetailViewController, animated: true, completion: nil)
    }
    
    @IBAction func deleteBtn(_ sender: UIButton) {
        dream.remove(at: passIndex!)
        
        let mainTabController = MainTabController(nibName: "MainTabController", bundle: nil)

        mainTabController.modalPresentationStyle = .fullScreen
        mainTabController.selectedIndex = 1
        present(mainTabController, animated: true, completion: nil)
    }
    @IBAction func editDream(_ sender: UIButton) {
        passCurrentAmount = setStringToDecimal(amountValue: fieldCurrentAmount.text ?? "")
        passTargetAmount = setStringToDecimal(amountValue: fieldTargetAmount.text ?? "")
        
        dream[passIndex!] = Dream(dreamTitle: fieldDreamTitle.text , dreamCurrentAmount: passCurrentAmount, dreamTargetAmount: passTargetAmount)
        
        let mainTabController = MainTabController(nibName: "MainTabController", bundle: nil)

        mainTabController.modalPresentationStyle = .fullScreen
        mainTabController.selectedIndex = 1
        present(mainTabController, animated: true, completion: nil)
    }
    
}

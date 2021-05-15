//
//  AddDreamViewController.swift
//  MyMoneeProject
//
//  Created by MacBook on 14/05/21.
//

import UIKit

class AddDreamViewController: UIViewController {

    @IBOutlet weak var fieldDreamTitle: UITextField!
    @IBOutlet weak var fieldTargetAmount: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func BackToHome(_ sender: UITapGestureRecognizer) {
        let mainTabController = MainTabController(nibName: "MainTabController", bundle: nil)
        mainTabController.modalPresentationStyle = .fullScreen
        mainTabController.selectedIndex = 1
        present(mainTabController, animated: false, completion: nil)
    }
    

    @IBAction func insertRow(_ sender: UIButton) {
        let dreamRecord = dream.endIndex
        let dreamId: Int = dreamRecord + 1
        let dreamTitle = fieldDreamTitle.text ?? ""
        let targetAmount = setStringToDecimal(amountValue: fieldTargetAmount.text ?? "")
        
        dream.append(Dream(id: dreamId, dreamTitle: dreamTitle, dreamCurrentAmount: 0, dreamTargetAmount: targetAmount))

        let mainTabController = MainTabController(nibName: "MainTabController", bundle: nil)

        mainTabController.modalPresentationStyle = .fullScreen
        mainTabController.selectedIndex = 1
        present(mainTabController, animated: true, completion: nil)
    }
    
}



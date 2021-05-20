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
    
    var delegate: DreamProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func BackToHome(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func insertRow(_ sender: UIButton) {
        let dreamRecord = dream.endIndex
        let dreamId: Int = dreamRecord + 1
        let dreamTitle = fieldDreamTitle.text ?? ""
//        let targetAmount = setStringToDecimal(amountValue: fieldTargetAmount.text ?? "")
        let targetAmount = fieldTargetAmount.text?.setStringToDecimal ?? 0
//
        dream.append(Dream(id: dreamId, dreamTitle: dreamTitle, dreamAmount: targetAmount))

//        self.dismiss(animated: true) {
//            self.delegate?.modifiedData(id: dreamId, dreamTitle: dreamTitle, dreamAmount: targetAmount)
//        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
}

//extension AddUsageViewController: ConvertVariable {
//    setStringToDecimal(amountValue: fieldTargetAmount.text ?? "")
//}


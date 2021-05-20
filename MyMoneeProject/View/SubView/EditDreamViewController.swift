//
//  EditDreamViewController.swift
//  MyMoneeProject
//
//  Created by MacBook on 14/05/21.
//

import UIKit

class EditDreamViewController: UIViewController {

    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var fieldDreamTitle: UITextField!
    @IBOutlet weak var fieldTargetAmount: UITextField!
    
    
    let mainRed = UIColor(red: 235.0/255.0, green: 87.0/255.0, blue: 87.0/255.0, alpha: 1.0)
    
    var passIndex: Int? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        deleteBtn.layer.cornerRadius = 20
        deleteBtn.layer.borderWidth = 3.0
        deleteBtn.layer.borderColor = mainRed.cgColor
        
        fieldDreamTitle.text = dream[passIndex!].dreamTitle
//        fieldTargetAmount.text = convert.setAmountString(amountValue: dream[passIndex!].dreamAmount).replacingOccurrences(of: ".", with: "")
        fieldTargetAmount.text = dream[passIndex!].dreamAmount.setAmountString.replacingOccurrences(of: ".", with: "")
        
    }

    @IBAction func backBtn(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deleteBtn(_ sender: UIButton) {
        let deleteAlert = UIAlertController(title: "Menghapus Impian", message: "Apakah Anda yakin menghapus \"\(dream[passIndex!].dreamTitle)\"?", preferredStyle: .alert)
        
        let tapDelete = UIAlertAction(title: "Hapus", style: .destructive) { [self] (_) -> Void in
            deleteAction()
        }
        
        let tapCancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        deleteAlert.addAction(tapDelete)
        deleteAlert.addAction(tapCancel)
        
        present(deleteAlert, animated: true, completion: nil)
        
    }
    
    @IBAction func editDream(_ sender: UIButton) {
        let dreamAmount = fieldTargetAmount.text?.setStringToDecimal ?? 0
        
        
        dream[passIndex!] = Dream(id: dream[passIndex!].id, dreamTitle: fieldDreamTitle.text ?? "", dreamAmount: dreamAmount)
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}

extension EditDreamViewController {
    
    fileprivate func deleteAction() {
        let dreamDetailViewController = DreamDetailViewController(nibName: "DreamDetailViewController", bundle: nil)
        dreamDetailViewController.passIndex = passIndex
        dream.remove(at: passIndex!)
        
//        let mainTabController = MainTabController(nibName: "MainTabController", bundle: nil)
//
//        mainTabController.modalPresentationStyle = .fullScreen
//        mainTabController.selectedIndex = 1
//        present(mainTabController, animated: false, completion: nil)
//        self.dismiss(animated: true, completion: nil)
        view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
}

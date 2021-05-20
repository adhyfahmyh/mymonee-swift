//
//  AddUsageViewController.swift
//  MyMoneeProject
//
//  Created by MacBook on 13/05/21.
//

import UIKit

class AddUsageViewController: UIViewController {

    @IBOutlet weak var fieldTitle: UITextField!
    @IBOutlet weak var fieldAmount: UITextField!
    @IBOutlet weak var categoryCollection: UICollectionView!
    
    @IBOutlet weak var saveBtn: UIButton!
    
    
    var usageType:Int? = nil
    var delegate: updateDataHome?
    private var moneyIn: Decimal = wallets[0].totalMoneyIn ?? 0
    private var moneyOut: Decimal = wallets[0].totalMoneyOut ?? 0
    var convert = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        disabledBtn(saveBtn)
        
        categoryCollection.delegate = self
        categoryCollection.dataSource = self
        
        let uiNib = UINib(nibName: String(describing: SelectCollectionViewCell.self), bundle: nil)
        categoryCollection.register(uiNib, forCellWithReuseIdentifier: String(describing: SelectCollectionViewCell.self))
        
        fieldTitle.delegate = self
        fieldAmount.delegate = self
    }
    
    @IBAction func saveData(_ sender: UIButton) {
//        let usageRecord = moneyUsage.endIndex
//        let usageId: Int = usageRecord + 1
//        let usageTitle = fieldTitle.text ?? ""
////        let amount = convert.setStringToDecimal(amountValue: fieldAmount.text ?? "")
//        let amount = fieldAmount.text?.setStringToDecimal ?? 0
//
//        let dateNow: String = Date().dateTime
        
//        var statusType: moneyStatus?
//        if usageType == 0 {
//            statusType = .moneyIn
//            wallets[0].totalMoneyIn! = moneyIn + amount
//            users[0].balance! += amount
//        } else {
//            statusType = .moneyOut
//            wallets[0].totalMoneyOut! = moneyOut + amount
//            users[0].balance! -= amount
//        }
        
        let usageId: String = UUID().uuidString
        let usageTitle = fieldTitle.text ?? ""
//        let amount = convert.setStringToDecimal(amountValue: fieldAmount.text ?? "")
        let amount = fieldAmount.text?.setStringToDecimal ?? 0
        
        var statusType: String?
        if usageType == 0 {
            statusType = "pemasukan"
            wallets[0].totalMoneyIn! = moneyIn + amount
            users[0].balance! += amount
        } else {
            statusType = "pengeluaran"
            wallets[0].totalMoneyOut! = moneyOut + amount
            users[0].balance! -= amount
        }
        
        MoneyService().addTransaction(uploadDataModel: TransactionResponse(id: usageId, date: Date().dateTime, usageTitle: usageTitle, usageAmount: amount, status: statusType))
        
        self.dismiss(animated: true, completion: nil)
//        {
//            self.delegate?.update(id: usageId, status: statusType!, usageTitle: usageTitle, date: dateNow, usageAmount: amount)
//        }
    }
    
    @IBAction func backToHome(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension AddUsageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {        return CGSize(width: collectionView.frame.width/2-10, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = categoryCollection.dequeueReusableCell(withReuseIdentifier: String(describing: SelectCollectionViewCell.self), for: indexPath) as! SelectCollectionViewCell
        cell.categoryImg.image = UIImage(named: categories[indexPath.row].iconCategory)
        cell.categoryLbl.text = categories[indexPath.row].lblCategory
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = Colors.mainBlue.cgColor
        cell?.layer.borderWidth = 3.0
        cell?.layer.cornerRadius = 8.0
        
        usageType = indexPath.row
        if (fieldTitle.text != "") && (fieldAmount.text != "") {
            enabledBtn(saveBtn)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 0
        cell?.layer.borderColor = .none
        
    }
    
}

extension AddUsageViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let txtField = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        if txtField.isEmpty || usageType == nil || fieldTitle.text == "" || fieldAmount.text == "" {
            disabledBtn(saveBtn)
        } else {
            enabledBtn(saveBtn)
        }
        
        return true
    }
}

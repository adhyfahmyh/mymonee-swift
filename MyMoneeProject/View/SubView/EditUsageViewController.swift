//
//  EditUsageViewController.swift
//  MyMoneeProject
//
//  Created by MacBook on 13/05/21.
//

import UIKit

class EditUsageViewController: UIViewController {

    @IBOutlet weak var fieldTitle: UITextField!
    @IBOutlet weak var fieldAmount: UITextField!
    @IBOutlet weak var categoryCollection: UICollectionView!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    
    var passIndex: Int? = nil
    var delegate: updateDataHome?
    private var usageType: Int?
//    private var moneyIn: Decimal = wallets[0].totalMoneyIn ?? 0
//    private var moneyOut: Decimal = wallets[0].totalMoneyOut ?? 0
    
    
    private var moneyIn: Decimal = myWallet.first?.totalMoneyIn ?? 0
    private var moneyOut: Decimal = myWallet.first?.totalMoneyOut ?? 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryCollection.delegate = self
        categoryCollection.dataSource = self
        
        let uiNib = UINib(nibName: String(describing: SelectCollectionViewCell.self), bundle: nil)
        categoryCollection.register(uiNib, forCellWithReuseIdentifier: String(describing: SelectCollectionViewCell.self))

        deleteBtn.layer.cornerRadius = 20
        deleteBtn.layer.borderWidth = 3.0
        deleteBtn.layer.borderColor = Colors.mainRed.cgColor
        
        self.loadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.loadData()
    }
}

// Selection using Collection
extension EditUsageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2-10, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = categoryCollection.dequeueReusableCell(withReuseIdentifier: String(describing: SelectCollectionViewCell.self), for: indexPath) as! SelectCollectionViewCell
        
        if indexPath.row == usageType {
            categoryCollection.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
            cell.layer.borderColor = Colors.mainBlue.cgColor
            cell.layer.borderWidth = 3.0
            cell.layer.cornerRadius = 8.0
        } else {
            cell.layer.borderWidth = 0
            cell.layer.borderColor = .none
        }
        
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
            enabledBtn(editBtn)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 0
        cell?.layer.borderColor = .none
    }
    
}


// Action Button
extension EditUsageViewController {
    
    @IBAction func backBtn(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editAction(_ sender: UIButton) {
        
////        let usageAmount = convert.setStringToDecimal(amountValue: fieldAmount.text ?? "")
//        let usageAmount = fieldAmount.text?.setStringToDecimal ?? 0
//
//        var statusType: moneyStatus?
//        if usageType == 0 {
//            statusType = .moneyIn
//            wallets[0].totalMoneyIn! = (moneyIn) - (moneyUsage[passIndex!].usageAmount ?? 0)
//            wallets[0].totalMoneyIn! += usageAmount
//        } else {
//            statusType = .moneyOut
//            wallets[0].totalMoneyOut! = (moneyOut) - (moneyUsage[passIndex!].usageAmount ?? 0)
//            wallets[0].totalMoneyOut! += usageAmount
//        }
//
//        moneyUsage[passIndex!] = MoneyUsage(id: moneyUsage[passIndex!].id, status: statusType! , usageTitle: fieldTitle.text, date: Date().dateTime, usageAmount: usageAmount )
//
//        users[0].balance! = (wallets[0].totalMoneyIn!) - (wallets[0].totalMoneyOut!)
        

        let usageAmount = fieldAmount.text?.setStringToDecimal ?? 0
        var totalMoneyIn: Decimal = myWallet.first?.totalMoneyIn ?? 0
        var totalMoneyOut: Decimal = myWallet.first?.totalMoneyOut ?? 0
        var statusType: String?
        
//        var balanceEdit = myUser.first?.balance
        
        if transaction[passIndex!].status == "pemasukan" {
            statusType = "pemasukan"
            totalMoneyIn = (moneyIn) - (transaction[passIndex!].usageAmount ?? 0)
//            totalMoneyIn += usageAmount
//            WalletService().editWallet(editModel: WalletResponse(id: myWallet.first?.id, userId: myWallet.first?.userId, totalMoneyIn: totalMoneyIn, totalMoneyOut: totalMoneyOut), id: "1")
            WalletService().editWallet(editModel: WalletResponse(id: myWallet.first?.id, userId: myWallet.first?.userId, totalMoneyIn: (totalMoneyIn + usageAmount), totalMoneyOut: totalMoneyOut), id: "1")
//            balanceEdit = ((totalMoneyIn) - (totalMoneyOut))
        } else {
            statusType = "pengeluaran"
            totalMoneyOut = (moneyOut) - (transaction[passIndex!].usageAmount ?? 0)
//            totalMoneyOut += usageAmount
//            WalletService().editWallet(editModel: WalletResponse(id: myWallet[0].id, userId: myWallet[0].userId, totalMoneyIn: totalMoneyIn, totalMoneyOut: totalMoneyOut), id: "1")
            WalletService().editWallet(editModel: WalletResponse(id: myWallet[0].id, userId: myWallet[0].userId, totalMoneyIn: totalMoneyIn, totalMoneyOut: (totalMoneyOut + usageAmount)), id: "1")
//            balanceEdit = ((totalMoneyIn) - (totalMoneyOut))
        }
        
        MoneyService().editTransaction(editModel: TransactionResponse(id: transaction[passIndex ?? 0].id ?? "", date: Date().dateTime, usageTitle: fieldTitle.text, usageAmount: usageAmount, status: statusType), id: transaction[passIndex ?? 0].id ?? "")
        
//        let balanceEdit: Decimal = ((totalMoneyIn) - (totalMoneyOut))
//        UserService().editUser(editModel: UserResponse(id: myUser.first?.id, name: myUser.first?.name, balance: balanceEdit, displayPicture: myUser.first?.displayPicture), id: "1")
        
        
//        self.dismiss(animated: true, completion: nil)
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func deleteAction(_ sender: UIButton) {
//        let deleteAlert = UIAlertController(title: "Menghapus Penggunaan", message: "Apakah Anda yakin menghapus \"\(moneyUsage[passIndex!].usageTitle ?? "")\"?", preferredStyle: .alert)
//
//        let tapDelete = UIAlertAction(title: "Hapus", style: .destructive) { [self] (_) -> Void in
//            deleteRow()
//        }
//
//        let tapCancel = UIAlertAction(title: "Batal", style: .cancel)
//
//        deleteAlert.addAction(tapDelete)
//        deleteAlert.addAction(tapCancel)
//
//        present(deleteAlert, animated: true, completion: nil)
        
        let deleteAlert = UIAlertController(title: "Menghapus Penggunaan", message: "Apakah Anda yakin menghapus \"\(transaction[passIndex!].usageTitle ?? "")\"?", preferredStyle: .alert)

        let tapDelete = UIAlertAction(title: "Hapus", style: .destructive) { [self] (_) -> Void in
            deleteRow()
        }

        let tapCancel = UIAlertAction(title: "Batal", style: .cancel)

        deleteAlert.addAction(tapDelete)
        deleteAlert.addAction(tapCancel)

        present(deleteAlert, animated: true, completion: nil)
    }
    
    
    func deleteRow() {
//        if usageType == 0 {
////            wallets[0].totalMoneyIn! = moneyIn - convert.setStringToDecimal(amountValue: fieldAmount.text ?? "")
//            wallets[0].totalMoneyIn! = moneyIn - (fieldAmount.text?.setStringToDecimal ?? 0)
//        } else {
////            wallets[0].totalMoneyOut! = moneyOut - convert.setStringToDecimal(amountValue: fieldAmount.text ?? "")
//            wallets[0].totalMoneyOut! = moneyOut - (fieldAmount.text?.setStringToDecimal ?? 0)
//        }
//        moneyUsage.remove(at: passIndex!)
//        users[0].balance! = (wallets[0].totalMoneyIn!) - (wallets[0].totalMoneyOut!)
        
        MoneyService().deleteTransaction(id: transaction[passIndex!].id ?? "")
//        var balance: Decimal = myUser.first?.balance ?? 0
        var totalMoney: Decimal?
        if transaction[passIndex!].status == "pemasukan" {
            totalMoney = moneyIn - (fieldAmount.text?.setStringToDecimal ?? 0)
            WalletService().editWallet(editModel: WalletResponse(id: myWallet.first?.id, userId: myWallet.first?.userId, totalMoneyIn: totalMoney, totalMoneyOut: moneyOut), id: "1")
//            balance = (myUser.first?.balance ?? 0) - moneyIn
        } else {
            totalMoney = moneyOut - (fieldAmount.text?.setStringToDecimal ?? 0)
            WalletService().editWallet(editModel: WalletResponse(id: myWallet[0].id, userId: myWallet[0].userId, totalMoneyIn: moneyIn, totalMoneyOut: totalMoney), id: "1")
//            balance = (myUser.first?.balance ?? 0) + moneyOut
        }
        
//        UserService().editUser(editModel: UserResponse(id: myUser.first?.id, name: myUser.first?.name, balance: balance, displayPicture: myUser.first?.displayPicture), id: myWallet.first?.userId ?? "")
        
        
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
}

extension EditUsageViewController {
    
    fileprivate func loadData() {
        //        fieldTitle.text = moneyUsage[passIndex!].usageTitle
        ////        fieldAmount.text = convert.setAmountString(amountValue: moneyUsage[passIndex!].usageAmount ?? 0).replacingOccurrences(of: ".", with: "")
        //
        //        fieldAmount.text = moneyUsage[passIndex!].usageAmount?.setAmountString.replacingOccurrences(of: ".", with: "")
        //
        //        usageType = moneyUsage[passIndex!].status ==  moneyStatus.moneyIn ? 0 : 1
        
        
        fieldTitle.text = transaction[passIndex!].usageTitle
        
        fieldAmount.text = transaction[passIndex!].usageAmount?.setAmountString.replacingOccurrences(of: ".", with: "")
        
        usageType = transaction[passIndex!].status ?? "" ==  "pemasukan" ? 0 : 1
    }
}

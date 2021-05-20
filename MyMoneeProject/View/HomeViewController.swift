import UIKit

protocol updateDataHome {
    func update(id: Int, status: moneyStatus, usageTitle: String, date: String, usageAmount: Decimal)
}

class HomeViewController: UIViewController{

    @IBOutlet weak var usageHistoryTable: UITableView!
    @IBOutlet weak var greeting: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userBalance: UILabel!
    @IBOutlet weak var moneyInLbl: UILabel!
    @IBOutlet weak var moneyOutLbl: UILabel!
    @IBOutlet weak var notFoundView: NotFoundView!
    
//    var userAPI: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notFoundView.isHidden = true
        
        self.dynamicGreetings()
        self.setLabelHome()
        self.loadData()
        self.loadData()
        
        usageHistoryTable.delegate = self
        usageHistoryTable.dataSource = self
        usageHistoryTable.separatorStyle = .none
        
        let uiNib = UINib(nibName: String(describing: HomeTableViewCell.self), bundle: nil)
        usageHistoryTable.register(uiNib, forCellReuseIdentifier: String(describing: HomeTableViewCell.self))
        usageHistoryTable.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.dynamicGreetings()
        self.setLabelHome()
        usageHistoryTable.reloadData()
        self.loadData()
    }
    
    @IBAction func addUsage(_ sender: Any) {
        let addUsageViewController = AddUsageViewController(nibName: "AddUsageViewController", bundle: nil)
        addUsageViewController.modalPresentationStyle = .fullScreen
        addUsageViewController.delegate = self
        present(addUsageViewController, animated: true, completion: nil)
//        navigationController?.popToViewController(addUsageViewController, animated: true)
    }

}

extension HomeViewController:  UITableViewDelegate, UITableViewDataSource {
    
//    fileprivate func reloadData() -> Int {
//        //
//        //        if moneyUsage.count > 0 {
//        //            self.usageHistoryTable.isHidden = false
//        //            self.notFoundView.isHidden = true
//        //            moneyUsage.reverse()
//        //            return moneyUsage.count
//        //        } else {
//        //            self.usageHistoryTable.isHidden = true
//        //            self.notFoundView.isHidden = false
//        //            notFoundView.addUsageBtn.setTitle("Tambah Penggunaan", for: .normal)
//        //            notFoundView.addUsageBtn.addTarget(self, action: #selector(self.addUsage(_:)), for: .touchUpInside)
//        //            return 0
//        //        }
//
//
//        if transaction.count > 0 {
//            self.usageHistoryTable.isHidden = false
//            self.notFoundView.isHidden = true
//            transaction.reverse()
//            return transaction.count
//        } else {
//            self.usageHistoryTable.isHidden = true
//            self.notFoundView.isHidden = false
//            notFoundView.addUsageBtn.setTitle("Tambah Penggunaan", for: .normal)
//            notFoundView.addUsageBtn.addTarget(self, action: #selector(self.addUsage(_:)), for: .touchUpInside)
//            return 0
//        }
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        if moneyUsage.count > 0 {
//            self.usageHistoryTable.isHidden = false
//            self.notFoundView.isHidden = true
//            moneyUsage.reverse()
//            return moneyUsage.count
//        } else {
//            self.usageHistoryTable.isHidden = true
//            self.notFoundView.isHidden = false
//            notFoundView.addUsageBtn.setTitle("Tambah Penggunaan", for: .normal)
//            notFoundView.addUsageBtn.addTarget(self, action: #selector(self.addUsage(_:)), for: .touchUpInside)
//            return 0
//        }
        
        if transaction.count > 0 {
            self.usageHistoryTable.isHidden = false
            self.notFoundView.isHidden = true
            return transaction.count
        } else {
            self.usageHistoryTable.isHidden = true
            self.notFoundView.isHidden = false
            notFoundView.addUsageBtn.setTitle("Tambah Penggunaan", for: .normal)
            notFoundView.addUsageBtn.addTarget(self, action: #selector(self.addUsage(_:)), for: .touchUpInside)
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = usageHistoryTable.dequeueReusableCell(withIdentifier: String(describing: HomeTableViewCell.self), for: indexPath) as! HomeTableViewCell
//        BEFORE API
////        let totalAmount = convert.setDecimalToString(amountValue: moneyUsage[indexPath.row].usageAmount ?? 0)
//        let totalAmount = moneyUsage[indexPath.row].usageAmount?.setDecimalToString ?? ""
//
//        cell.usageTitle.text = moneyUsage[indexPath.row].usageTitle
//        cell.date.text = moneyUsage[indexPath.row].date
//        if moneyUsage[indexPath.row].status == moneyStatus.moneyOut {
//            cell.icon.image = UIImage(named: "arrow_down_box")
//            cell.usageAmount.text = "-Rp. "+totalAmount
//            cell.usageAmount.textColor = Colors.mainRed
//        } else {
//            cell.icon.image = UIImage(named: "arrow_up_box")
//            cell.usageAmount.text = "+Rp. "+totalAmount
//            cell.usageAmount.textColor = Colors.mainGreen
//        }
        
//        CELL API
        let totalAmount = transaction[indexPath.row].usageAmount?.setDecimalToString ?? ""
        cell.usageTitle.text = transaction[indexPath.row].usageTitle
        cell.date.text = transaction[indexPath.row].date
        if transaction[indexPath.row].status == "pengeluaran" {
            cell.icon.image = UIImage(named: "arrow_down_box")
            cell.usageAmount.text = "-Rp. "+totalAmount
            cell.usageAmount.textColor = Colors.mainRed
        } else {
            cell.icon.image = UIImage(named: "arrow_up_box")
            cell.usageAmount.text = "+Rp. "+totalAmount
            cell.usageAmount.textColor = Colors.mainGreen
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let usageDetailViewController = UsageDetailViewController(nibName: "UsageDetailViewController", bundle: nil)
        
        usageDetailViewController.modalPresentationStyle = .fullScreen
        usageDetailViewController.modalTransitionStyle = .coverVertical
        
        usageDetailViewController.passIndex = indexPath.row
        
        self.present(usageDetailViewController, animated: true, completion: nil)
    }
}

extension HomeViewController: updateDataHome {
    
//    func update(id: Int, status: moneyStatus, usageTitle: String, date: String, usageAmount: Decimal) {
    func update(id: Int, status: moneyStatus, usageTitle: String, date: String, usageAmount: Decimal) {
        moneyUsage.append(MoneyUsage(id: id, status: status, usageTitle: usageTitle, date: date, usageAmount: usageAmount))
        setLabelHome()
        usageHistoryTable.reloadData()
    }
    
    func dynamicGreetings() {
        let time = Date().hour
        
        switch time {
            case 1..<11: self.greeting.text = "Selamat Pagi,"
            case 11..<15: self.greeting.text = "Selamat Siang,"
            case 15..<18: self.greeting.text = "Selamat Sore,"
            case 18..<24: self.greeting.text = "Selamat Malam,"
            default:self.greeting.text = "Selamat Datang, "
        }
    }
    
    func setLabelHome() {
        userName.text = users.first?.name
//        userBalance.text = "Rp. \(convert.setAmountString(amountValue: users[0].balance ?? 0))"
//        moneyInLbl.text = "Rp. \(convert.setAmountString(amountValue: wallets[0].totalMoneyIn ?? 0))"
//        moneyOutLbl.text = "Rp. \(convert.setAmountString(amountValue: wallets[0].totalMoneyOut ?? 0))"
        userBalance.text = "Rp. \(users.first?.balance?.setAmountString ?? "")"
        moneyInLbl.text = "Rp. \(wallets.first?.totalMoneyIn?.setAmountString ?? "")"
        moneyOutLbl.text = "Rp. \(wallets.first?.totalMoneyOut?.setAmountString ?? "")"
//        userName.text = userAPI.first?.name
    }
    
    func loadData() {
        MoneyService().loadTransactions{ (list) in
            DispatchQueue.main.async {
                transaction = list
                self.usageHistoryTable.reloadData()
            }
        }
        WalletService().loadWallet(completion: { (list) in
            myWallet = list
        })
    }
    
}

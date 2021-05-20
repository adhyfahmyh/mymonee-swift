//
//  DreamTableViewCell.swift
//  MyMoneeProject
//
//  Created by MacBook on 13/05/21.
//

import UIKit

class DreamTableViewCell: UITableViewCell {

    @IBOutlet weak var dreamViewCell: UIView!
    @IBOutlet weak var dreamTitle: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var dreamAmount: UILabel!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    
    var delegate: DreamProtocol?
    
    var dreamId: Int?
    var title: String?
    var amount: Decimal?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func deleteAction(_ sender: UIButton) {
        delegate?.deleteConfirm(with: dreamId ?? 0)
    }
    
    @IBAction func confirmAction(_ sender: UIButton) {
        delegate?.confirm(with: dreamId ?? 0)
    }
    
    
    
    func configure(with dreamId: Int) {
        self.dreamId = dreamId
        deleteButton.setTitle(String(dreamId), for: .normal)
    }
    
}

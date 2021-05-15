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
    @IBOutlet weak var dreamCurrentAmount: UILabel!
    @IBOutlet weak var dreamTargetAmount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

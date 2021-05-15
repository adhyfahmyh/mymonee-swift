//
//  HomeTableViewCell.swift
//  MyMoneeProject
//
//  Created by MacBook on 13/05/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var usageTitle: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var usageAmount: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

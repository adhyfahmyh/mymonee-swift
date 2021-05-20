//
//  SelectCollectionViewCell.swift
//  MyMoneeProject
//
//  Created by MacBook on 15/05/21.
//

import UIKit

class SelectCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryImg: UIImageView!
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellView.layer.shadowColor = UIColor.black.cgColor
        cellView.layer.shadowOpacity = 0.3
        cellView.layer.shadowOffset = CGSize(width: 0, height: 2)
        cellView.layer.cornerRadius = 6
    }

}

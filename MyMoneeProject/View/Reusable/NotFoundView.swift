//
//  NotFoundView.swift
//  MyMoneeProject
//
//  Created by MacBook on 15/05/21.
//

import UIKit

class NotFoundView: UIView {

    @IBOutlet weak var notFoundView: UIView!
    @IBOutlet weak var addUsageBtn: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
        
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("NotFoundView", owner: self, options: nil)
        addSubview(notFoundView)
        notFoundView.frame = self.bounds
        notFoundView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addUsageBtn.layer.backgroundColor = Colors.mainBlue.cgColor
        addUsageBtn.layer.cornerRadius = 24
    }

}

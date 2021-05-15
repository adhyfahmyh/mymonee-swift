//
//  EditUsageViewController.swift
//  MyMoneeProject
//
//  Created by MacBook on 13/05/21.
//

import UIKit

class EditUsageViewController: UIViewController {

    @IBOutlet weak var deleteBtn: UIButton!
    let mainRed = UIColor(red: 235.0/255.0, green: 87.0/255.0, blue: 87.0/255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        deleteBtn.layer.cornerRadius = 20
        deleteBtn.layer.borderWidth = 3.0
        deleteBtn.layer.borderColor = mainRed.cgColor
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

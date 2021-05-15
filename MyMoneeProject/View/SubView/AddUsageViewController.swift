//
//  AddUsageViewController.swift
//  MyMoneeProject
//
//  Created by MacBook on 13/05/21.
//

import UIKit

class AddUsageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func BackToHome(_ sender: UITapGestureRecognizer) {
        let mainTabController = MainTabController(nibName: "MainTabController", bundle: nil)
        mainTabController.modalPresentationStyle = .fullScreen
        mainTabController.selectedIndex = 0
        present(mainTabController, animated: false, completion: nil)
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

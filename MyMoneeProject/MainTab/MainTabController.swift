//
//  MainTabController.swift
//  MyMoneeProject
//
//  Created by MacBook on 13/05/21.
//

import UIKit

class MainTabController: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.barTintColor = .white
        
//        HOME TAB
        let home = HomeViewController(nibName: String(describing: HomeViewController.self), bundle: nil)
        let homeTab = UINavigationController(rootViewController: home)
        homeTab.setNavigationBarHidden(true, animated: false)
        let homeImage = UIImage(named: "home")?.withRenderingMode(.alwaysOriginal)
        let homeImageSelected = UIImage(named: "home_selected")?.withRenderingMode(.alwaysOriginal)
        homeTab.tabBarItem = UITabBarItem(title: "Home", image: homeImage, selectedImage: homeImageSelected)
        homeTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        homeTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        homeTab.tabBarItem.tag = 0
        
//        DREAM TAB
        let impian = DreamViewController(nibName: String(describing: DreamViewController.self), bundle: nil)
        let impianTab = UINavigationController(rootViewController: impian)
        impianTab.setNavigationBarHidden(true, animated: false)
        let impianImage = UIImage(named: "dream")?.withRenderingMode(.alwaysOriginal)
        let impianImageSelected = UIImage(named: "dream_selected")?.withRenderingMode(.alwaysOriginal)
        impianTab.tabBarItem = UITabBarItem(title: "Impian", image: impianImage, selectedImage: impianImageSelected)
        impianTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        impianTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        impianTab.tabBarItem.tag = 0
        
//        PROFILE TAB
        let profile = ProfileViewController(nibName: String(describing: ProfileViewController.self), bundle: nil)
        let profileTab = UINavigationController(rootViewController: profile)
        profileTab.setNavigationBarHidden(true, animated: false)
        let profileImage = UIImage(named: "profile")?.withRenderingMode(.alwaysOriginal)
        let profileImageSelected = UIImage(named: "profile_selected")?.withRenderingMode(.alwaysOriginal)
        profileTab.tabBarItem = UITabBarItem(title: "Profile", image: profileImage, selectedImage: profileImageSelected)
        profileTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
        profileTab.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        profileTab.tabBarItem.tag = 0
        
        
        self.viewControllers = [homeTab, impianTab, profileTab]
    
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

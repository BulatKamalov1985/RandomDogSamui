//
//  MainTabController.swift
//  RandomDogSamui
//
//  Created by Bulat Kamalov on 29.03.2023.
//

import UIKit

class MainTabController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
    }
    
    func configureVC(){
        let home = HomePageVC()
        home.tabBarItem.image = UIImage(systemName: "person.fill")
        let tableVC = TableViewController()
        tableVC.tabBarItem.image = UIImage(systemName: "person.3.sequence")
        let collectionVC = CollectionViewController()
        collectionVC.tabBarItem.image = UIImage(systemName: "eye.fill")
        
        viewControllers = [home, tableVC, collectionVC]
    }
}

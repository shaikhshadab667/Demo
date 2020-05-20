//
//  TabbarMainVC.swift
//  Demo
//
//  Created by Mac on 17/05/20.
//  Copyright © 2020 Shadab Shaikh. All rights reserved.
//

import UIKit

class TabbarMainVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if #available(iOS 13, *) {
            let appearance = UITabBarAppearance()

            appearance.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.7294117647, blue: 0, alpha: 1)
            appearance.shadowImage = UIImage()
            appearance.shadowColor = #colorLiteral(red: 0.9764705882, green: 0.7294117647, blue: 0, alpha: 1)

            appearance.stackedLayoutAppearance.normal.iconColor = .black
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
            appearance.stackedLayoutAppearance.normal.badgeBackgroundColor = .blue

            appearance.stackedLayoutAppearance.selected.iconColor = .blue
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blue]

            self.tabBar.standardAppearance = appearance

        }
    }
    

 

}

//
//  NowPlayingDetailVC.swift
//  Demo
//
//  Created by Mac on 17/05/20.
//  Copyright © 2020 Shadab Shaikh. All rights reserved.
//

import UIKit

class NowPlayingDetailVC: UIViewController {

    var dataString : String!
    var detailTitle : String!
    var detailSubtitle: String!
    
    
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myImage.setImageFromURl(stringImageUrl: dataString)
        self.lblTitle.text = detailTitle
        self.lblSubTitle.text = detailSubtitle
        
    }
    


}

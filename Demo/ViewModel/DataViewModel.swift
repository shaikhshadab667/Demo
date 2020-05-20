//
//  DataViewModel.swift
//  Demo
//
//  Created by Mac on 18/05/20.
//  Copyright © 2020 Shadab Shaikh. All rights reserved.
//

import UIKit

class DataViewModel: NSObject {

    var title: String?
    var overview: String?
    var poster_path: String?
    var backdrop_path: String?
    
    
   // D I
    
    init(movie:DataModel){
        self.title = movie.title
        self.overview = movie.overview
        self.poster_path = movie.poster_path
        self.backdrop_path = movie.backdrop_path
    }
    
}


extension UIImageView{

func setImageFromURl(stringImageUrl url: String){

      if let url = NSURL(string: url) {
         if let data = NSData(contentsOf: url as URL) {
            self.image = UIImage(data: data as Data)
         }
      }
   }
}

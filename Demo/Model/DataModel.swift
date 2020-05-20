//
//  DataModel.swift
//  Demo
//
//  Created by Mac on 18/05/20.
//  Copyright © 2020 Shadab Shaikh. All rights reserved.
//

import UIKit

class DataModel: Decodable {
    
    var title: String?
    var overview: String?
    var poster_path: String?
    var backdrop_path: String?
    
    init(title:String, overview: String, poster_path: String, backdrop_path: String){
        self.title = title
        self.overview = overview
        self.poster_path = poster_path
        self.backdrop_path = backdrop_path
    }
}


class ResultsModel: Decodable {
    
    var results = [DataModel]()
    
    init(results: [DataModel]) {
        self.results = results
    }
    
}

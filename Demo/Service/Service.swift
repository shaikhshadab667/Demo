//
//  Service.swift
//  Demo
//
//  Created by Mac on 18/05/20.
//  Copyright © 2020 Shadab Shaikh. All rights reserved.
//

import UIKit

class Service: NSObject {

    
    static let shareInstance = Service()
    
    func getNowPlayingData(completion: @escaping([DataModel]?, Error?) -> ()){
        let urlString = "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error{
                completion(nil,err)
                print("Loading data error: \(err.localizedDescription)")
            }else{
                guard let data = data else { return }
                do{
                    var arrData = [DataModel]()
                    let results = try JSONDecoder().decode(ResultsModel.self, from: data)
                    for data in results.results{
                        
                        arrData.append(DataModel(title: data.title!, overview: data.overview!, poster_path: data.poster_path ?? "", backdrop_path: data.backdrop_path ?? ""))
                    }
                    completion(arrData, nil)
                }catch let jsonErr{
                    print("json error : \(jsonErr.localizedDescription)")
                }
            }
        }.resume()
    }
    
    
    func getTopRatedData(completion: @escaping([DataModel]?, Error?) -> ()){
        let urlString = "https://api.themoviedb.org/3/movie/top_rated?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error{
                completion(nil,err)
                print("Loading data error: \(err.localizedDescription)")
            }else{
                guard let data = data else { return }
                do{
                    var arrData = [DataModel]()
                    let results = try JSONDecoder().decode(ResultsModel.self, from: data)
                    for data in results.results{
                      arrData.append(DataModel(title: data.title!, overview: data.overview!, poster_path: data.poster_path ?? "", backdrop_path: data.backdrop_path ?? ""))
                    }
                    completion(arrData, nil)
                }catch let jsonErr{
                    print("json error : \(jsonErr.localizedDescription)")
                }
            }
        }.resume()
    }
}

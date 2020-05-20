//
//  TopRatedVC.swift
//  Demo
//
//  Created by Mac on 17/05/20.
//  Copyright © 2020 Shadab Shaikh. All rights reserved.
//

import UIKit

class TableViewCells : UITableViewCell{
    
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    
}


class TopRatedVC: UIViewController {

    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tbl: UITableView!
    
    var dataArray = [DataViewModel]()

    var refresher : UIRefreshControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        refresher = UIRefreshControl()
        refresher.attributedTitle = NSAttributedString(string: "pull to refresh")
        refresher.addTarget(self, action: #selector(populate), for: UIControl.Event.valueChanged)
        tbl.addSubview(refresher)
        
        self.getData()
        setUpSearchBar()
        alterLayout()

    }
    
    
    func getData(){
           Service.shareInstance.getTopRatedData { (movies, error) in
               if(error==nil){
                   self.dataArray = movies?.map({ return DataViewModel(movie: $0) }) ?? []
                   DispatchQueue.main.async {
                       self.tbl.reloadData()
                   }
               }
           }

       }
    
    
    @objc func populate()
       {
          for i in dataArray
          {
           dataArray.append(i) // api array appending
           }
          DispatchQueue.main.async {
               self.tbl.reloadData()
           }
           refresher.endRefreshing()
       }

    

}


extension TopRatedVC : UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCells") as! TableViewCells
        let MVM = dataArray[indexPath.row]
        cell.lblTitle.text = MVM.title ?? ""
        cell.lblSubTitle.text = MVM.overview ?? ""
        cell.backgroundColor = #colorLiteral(red: 1, green: 0.8, blue: 0, alpha: 1)
        
        
        
        let backDropPath = dataArray[indexPath.row].backdrop_path
        let imageUrl = "https://image.tmdb.org/t/p/original\(backDropPath!)"
        print("image url is \(imageUrl)")
        cell.myImage.setImageFromURl(stringImageUrl: imageUrl)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let backdrop_path = dataArray[indexPath.row].backdrop_path
        let detailData = dataArray[indexPath.row]
        let imageUrl = "https://image.tmdb.org/t/p/original\(backdrop_path!)"
        let topDetailVC = self.storyboard?.instantiateViewController(identifier: "TopRatedDetailVC") as! TopRatedDetailVC
        topDetailVC.dataString = imageUrl
        topDetailVC.detailTitle = detailData.title
        topDetailVC.detailSubtitle = detailData.overview
        
        self.navigationController?.pushViewController(topDetailVC, animated: true)
    }
}



extension TopRatedVC : UISearchBarDelegate
{
    private func setUpSearchBar() {
          searchBar.delegate = self
      }
    
    func alterLayout() {
        tbl.tableHeaderView = UIView()
        // search bar in section header
        tbl.estimatedSectionHeaderHeight = 50
        // search bar in navigation bar
        //navigationItem.leftBarButtonItem = UIBarButtonItem(customView: searchBar)
        navigationItem.titleView = searchBar
        searchBar.showsScopeBar = false // you can show/hide this dependant on your layout
        searchBar.placeholder = "Search"
    }
    
    // Search Bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard let searchText = searchBar.text else {return}
                        if searchText == ""
                        {
                            getData()
                        }
                        else
                        {
                            dataArray = dataArray.filter{
                                $0.title!.contains(searchText)
                            }
                          
                        }
                        DispatchQueue.main.async {
                            self.tbl.reloadData()
                              }
           }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

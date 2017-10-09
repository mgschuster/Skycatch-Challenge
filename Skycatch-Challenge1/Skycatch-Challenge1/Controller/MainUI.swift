//
//  MainVC.swift
//  Skycatch-Challenge1
//
//  Created by Admin on 10/9/17.
//  Copyright © 2017 TJSchoost. All rights reserved.
//

import UIKit
import AVFoundation
import Alamofire

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Variables
    var titles:[AnyObject] = []
    var releaseDates:[AnyObject] = []
    var locations:[AnyObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        downloadMovies()
    }
    
    func downloadMovies() {
        Alamofire.request(MAIN_URL).responseJSON { (response) in
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                if let meta = dict["meta"] as? Dictionary<String, AnyObject> {
                    if let view = meta["view"] as? Dictionary<String, AnyObject> {
                        if let columns = view["columns"] as? [Dictionary<String, AnyObject>] {
                            if let titles = columns[8]["cachedContents"] as? Dictionary<String, AnyObject> {
                                if let top = titles["top"] {
                                    self.titles = top as! [AnyObject]
                                    print(top)
                                    self.tableView.reloadData()
                                }
                            }
                            if let releaseYear = columns[9]["cachedContents"] as? Dictionary<String, AnyObject> {
                                if let top = releaseYear["top"] {
                                    self.releaseDates = top as! [AnyObject]
                                    self.tableView.reloadData()
                                }
                            }
                            if let locations = columns[10]["cachedContents"] as? Dictionary<String, AnyObject> {
                                if let top = locations["top"] {
                                    self.locations = top as! [AnyObject]
                                    self.tableView.reloadData()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell {
            
            let title = titles[indexPath.row]["item"]
            let releaseDate = releaseDates[indexPath.row]["item"]
            let location = locations[indexPath.row]["item"]
            
            let mov = Movie(name: (title as? String)!, releaseDate: (releaseDate as? String)!, location: (location as? String)!)
            cell.configureCell(mov)
            
            return cell
        } else {
            return UITableViewCell()
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 122
    }
}


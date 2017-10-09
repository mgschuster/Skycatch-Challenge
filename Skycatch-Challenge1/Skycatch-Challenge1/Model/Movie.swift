//
//  Movie.swift
//  Skycatch-Challenge1
//
//  Created by Admin on 10/9/17.
//  Copyright © 2017 TJSchoost. All rights reserved.
//

import Foundation
import Alamofire

class Movie {
    private var _name: String!
    private var _releaseDate: String!
    private var _location: String!
    var URL = MAIN_URL
    
    var name: String {
        if _name == nil {
            _name = ""
        }
        return _name
    }
    
    var releaseDate: String {
        if _releaseDate == nil {
            _releaseDate = ""
        }
        return _releaseDate
    }
    
    var location: String {
        if _location == nil {
            _location = ""
        }
        return _location
    }
    
    func downloadMovieDetails(completed: @escaping DownloadComplete) {
        Alamofire.request(URL).responseJSON { (response) in
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                if let meta = dict["meta"] as? Dictionary<String, AnyObject> {
                    if let view = meta["view"] as? Dictionary<String, AnyObject> {
                        if let columns = view["columns"] as? [Dictionary<String, AnyObject>] {
                            if let titles = columns[8]["cachedContents"] as? Dictionary<String, AnyObject> {
                                if let top = titles["top"] as? [Dictionary<String, String>] {
                                    for x in 0..<top.count {
                                        if let movieName = top[x]["item"] {
                                            self._name = movieName
                                            print(movieName)
                                        }
                                    }
                                }
                            }
                            if let releaseYear = columns[9]["cachedContents"] as? Dictionary<String, AnyObject> {
                                if let top = releaseYear["top"] as? [Dictionary<String, String>] {
                                    for x in 0..<top.count {
                                        if let releaseYear = top[x]["item"] {
                                            self._releaseDate = releaseYear
                                        }
                                    }
                                }
                            }
                            if let locations = columns[10]["cachedContents"] as? Dictionary<String, AnyObject> {
                                if let top = locations["top"] as? [Dictionary<String, String>] {
                                    for x in 0..<top.count {
                                        if let location = top[x]["item"] {
                                            self._location = location
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

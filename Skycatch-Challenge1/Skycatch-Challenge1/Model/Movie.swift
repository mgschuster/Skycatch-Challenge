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
    
    init(name: String, releaseDate: String, location: String) {
        self._name = name
        self._releaseDate = releaseDate
        self._location = location
    }
}

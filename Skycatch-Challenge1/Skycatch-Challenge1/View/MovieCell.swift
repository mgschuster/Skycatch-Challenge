//
//  MovieCell.swift
//  Skycatch-Challenge1
//
//  Created by Admin on 10/9/17.
//  Copyright © 2017 TJSchoost. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    // Outlets
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var releaseDateLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    
    // Varibles
    var movie: Movie!
    
    func configureCell(_ movie: Movie) {
        self.movie = movie
        
        nameLbl.text = self.movie.name
        releaseDateLbl.text = self.movie.releaseDate
        locationLbl.text = self.movie.location
    }

}

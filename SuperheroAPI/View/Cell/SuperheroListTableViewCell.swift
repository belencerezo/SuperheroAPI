//
//  SuperheroListTableViewCell.swift
//  SuperheroAPI
//
//  Created by Belén Cerezo on 19/10/22.
//

import UIKit

class SuperheroListTableViewCell: UITableViewCell {
    
    static let cellId = "superheroCell"

    @IBOutlet weak var superheroImageView: UIImageView!
    @IBOutlet weak var superheroNameLabel: UILabel!
    @IBOutlet weak var superheroDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func updateWithSuperhero(_ superhero: Superhero) {
        if let name = superhero.name {
            superheroNameLabel.text = name
        }
        
        var description = ""
        if let fullName = superhero.biography?.fullName {
            description = "\(fullName) - "
        }
        
        if let placeOfBirth = superhero.biography?.placeOfBirth {
            description = "\(description)\(placeOfBirth)"
        }
        
        superheroDescriptionLabel.text = description
        
        if let image = superhero.images?.sm {
            if let url = URL(string: image) {
                if let dataImage = try? Data(contentsOf: url) {
                    superheroImageView.image = UIImage(data: dataImage)
                }
            }
        }
    }
}

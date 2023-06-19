//
//  PlacesCell.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 19.06.2023.
//

import UIKit

class PlacesCell: UITableViewCell {

    @IBOutlet weak var label_resultName: UILabel!
    
    var indexPath: IndexPath?
    weak var delegate: PlacesCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCellLooks()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(with model: SuggestDataModel) {
 
        label_resultName.text = model.title
    }
    
    func configureCellLooks(){
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialLight)
        let blurView = UIVisualEffectView(effect: blurEffect)
        backgroundView = blurView
        backgroundColor = .clear
    }
    
}

//
//  SearchCell.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 17.06.2023.
//

import UIKit

class SearchCell: UITableViewCell {

    @IBOutlet weak var label_resultName: UILabel!
    
    var indexPath: IndexPath?
    weak var delegate: SearchCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCellLooks()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(with model: SearchCellModel) {
 
        label_resultName.text = model.resultName
    }
    
    func configureCellLooks(){
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialLight)
        let blurView = UIVisualEffectView(effect: blurEffect)
        backgroundView = blurView
        backgroundColor = .clear
    }
    
}

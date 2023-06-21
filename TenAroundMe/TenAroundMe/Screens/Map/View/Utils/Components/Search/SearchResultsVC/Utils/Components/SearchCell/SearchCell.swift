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
    
    func configure(with model: SuggestDataModel) {
        var content = self.defaultContentConfiguration()
        content.prefersSideBySideTextAndSecondaryText = true
        let maxTitleLength = 35
        
        // optionalTODO: This works with devices, but can be done with custom canvas
        if model.title.count > maxTitleLength {
            let truncatedTitle = String(model.title.prefix(maxTitleLength-3)) + "..."
            content.text = truncatedTitle.capitalizeFirstCharacter()
        } else {
            content.text = model.title.capitalizeFirstCharacter()
        }
        
        if model.distance != 0 {
            content.secondaryText = String(model.distance).appending(" m")
            content.secondaryTextProperties.font = UIFont.systemFont(ofSize: 12, weight: .ultraLight)
        } else {
            switch model.resutlType {
            case "categoryQuery":
                content.secondaryTextProperties.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
                content.secondaryText = "Category"
            case "chainQuery":
                content.secondaryTextProperties.font = UIFont.systemFont(ofSize: 12, weight: .thin)
                content.secondaryText = "Chain"
            default:
                content.prefersSideBySideTextAndSecondaryText = false
                
            }
        }
        
        self.contentConfiguration = content
        self.setNeedsLayout()
    }

    
    func configureCellLooks(){
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialLight)
        let blurView = UIVisualEffectView(effect: blurEffect)
        backgroundView = blurView
        backgroundColor = .clear
    }
    
}

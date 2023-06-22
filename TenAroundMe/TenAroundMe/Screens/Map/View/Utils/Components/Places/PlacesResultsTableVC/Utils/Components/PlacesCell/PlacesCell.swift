//
//  PlacesCell.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 19.06.2023.
//

import UIKit

typealias PlacesCellModel = PlacesDataModel

class PlacesCell: UITableViewCell {

    
    @IBOutlet weak var viewSeperating: UIView!
    @IBOutlet weak var labelPrimaryCategory: UILabel!
    @IBOutlet weak var labelStatus: UILabel!
    @IBOutlet weak var labelDistance: UILabel!
    @IBOutlet weak var labelPlacesTitle: UILabel!
    @IBOutlet weak var labelDistrict: UILabel!
    @IBOutlet weak var labelStreet: UILabel!
    @IBOutlet weak var buttonDetail: UIButton!
    
    
    var indexPath: IndexPath?
    weak var delegate: PlacesCellDelegate?
    private var place: PlacesCellModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCellLooks()
    }

    @IBAction func buttonDetailPressed(_ sender: Any) {
        guard let indexPath = self.indexPath else { return }
        guard let place = self.place else { return }
        self.delegate?.buttonDetailPressed(at: indexPath)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(with model: PlacesCellModel) {
        
        
        place = model
        
        ///Category
        if let primaryCategory = model.categories.first(where: { $0.primary == true }) {
            labelPrimaryCategory.text = primaryCategory.name ?? ""
        } else {
            labelPrimaryCategory.text = "N/A"
            
        }
        labelPrimaryCategory.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        /// Status
        if let isOpen = model.openingHours.first?.isOpen {
            labelStatus.text = isOpen ? "Open" : "Closed"
            labelStatus.textColor = isOpen ? .green : .red
            labelStatus.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        } else {
            labelStatus.text = "N/A"
            labelStatus.font = UIFont.systemFont(ofSize: 10, weight: .ultraLight)
        }
        /// Distance
        labelDistance.text = model.distance.formatDistance()
        labelDistance.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        /// Place Title
        labelPlacesTitle.text = model.title
        labelPlacesTitle.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        /// District
        labelDistrict.text = model.address.district
        labelDistrict.font = UIFont.systemFont(ofSize: 20, weight: .thin)
        /// Street
        labelStreet.text = model.address.street
        labelStreet.font = UIFont.systemFont(ofSize: 18, weight: .ultraLight)
    }
    
    func configureCellLooks(){
        self.contentView.backgroundColor = .clear
        viewSeperating.backgroundColor = .lightGray
        viewSeperating.layer.cornerRadius = 15
        backgroundColor = .clear
    }
    
}

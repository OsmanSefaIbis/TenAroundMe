//
//  DetailVC.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 15.06.2023.
//

/*
 optionalTODO: Precache the image when searchPerfom is invoked
 YELP API Related
 ~~~~~~~~~~~
 • API_KEY: VSByqNIHQ6nvtiTvjfEX0Q
 • Client ID: VSByqNIHQ6nvtiTvjfEX0Q
 */

import UIKit

final class DetailVC: UIViewController {
    
    @IBOutlet private weak var labelPlaceTitle: UILabel!
    @IBOutlet private weak var labelAddress: UILabel!
    @IBOutlet private weak var labelDistance: UILabel!
    @IBOutlet private weak var labelOpenHours: UILabel!
    @IBOutlet private weak var labelLatitude: UILabel!
    @IBOutlet private weak var labelLongitude: UILabel!
    @IBOutlet private weak var buttonWebsite: UIButton!
    @IBOutlet private weak var buttonPhone: UIButton!
    @IBOutlet private weak var labelCategories: UILabel!
    @IBOutlet private weak var stackViewCategories: UIView!
    
    private let place: PlacesDataModel
    
    var viewModel: MapVM!
    
    init(pass viewModel: MapVM, place: PlacesDataModel) {
        self.place = place
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.viewModel.detailView = self
        configureDetail()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureDetail() { // optionalTODO: Unit test
        loadViewIfNeeded()
        labelPlaceTitle.text = place.title
        labelAddress.text = place.addressLabel.isEmpty ? "N/A" : place.addressLabel 
        labelDistance.text = place.distance.formatDistance()
        labelOpenHours.text = place.openHour.isEmpty ? "N/A" : place.openHour
        labelLatitude.text = place.position.latitude.formatCoordinate()
        labelLongitude.text = place.position.longitude.formatCoordinate()
        labelCategories.text = place.categoryLabel
        let website = place.website.isEmpty ? "N/A" : place.website
        buttonWebsite.setTitle(website, for: .normal)
        let phone = place.phone.isEmpty ? "N/A" : place.phone
        buttonPhone.setTitle(phone, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonDirectionsPressed(_ sender: Any) {
        let coordinate = place.position
        guard let url = URL(string: "http://maps.apple.com/?daddr=\(coordinate.latitude),\(coordinate.longitude)")
        else { return }
        UIApplication.shared.open(url)
    }

    @IBAction func buttonLocationLogPressed(_ sender: Any) {
        viewModel.mapView?.dismissPresentingPlacesList()
        viewModel.mapView?.presentCoreDataTable()
    }
    @IBAction func buttonWebsitePressed(_ sender: Any) {
        if place.website != "N/A" {
            guard let url = URL(string: "\(place.website)") else { return }
            UIApplication.shared.open(url) /// WebKit?
        }
    }
    @IBAction func buttonPhonePressed(_ sender: Any) {
        if place.phone != "N/A" {
            guard let url = URL(string: "tel://\(place.phone.numberFormatter)") else { return }
            UIApplication.shared.open(url)
        }
    }

}


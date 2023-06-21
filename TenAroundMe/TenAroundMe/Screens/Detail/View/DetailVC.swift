//
//  DetailVC.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 15.06.2023.
//

import UIKit

final class DetailVC: UIViewController {
    
    /*
     TODO: Precache the image when searchPerfom is invoked
     
     YELP API Related
     ~~~~~~~~~~~
     
     • API_KEY: VSByqNIHQ6nvtiTvjfEX0Q
     
     • Client ID: VSByqNIHQ6nvtiTvjfEX0Q
     
     
     */

    let place: Places
    
    init(place: Places) {
        self.place = place
        super.init(nibName: nil, bundle: nil)
        configureDetail()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //TODO: IBAction
    @objc func directionsButtonTapped(_ sender: UIButton) {
        let coordinate = place.location.coordinate
        guard let url = URL(string: "http: //maps.apple.com/?daddr=\(coordinate.latitude), \(coordinate.longitude)")
        else { return }
        UIApplication.shared.open(url)
    }
    @objc func callButtonTapped(_ sender: UIButton) {
        guard let url = URL(string: "tel://\(place.phone.numberFormatter) ") else { return }
        UIApplication.shared.open(url)
    }
    
    private func configureDetail() {
        
//        nameLabel.text = place.name
//        addressLabel.text = place.address
        
    }


}


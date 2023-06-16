//
//  SearchVC.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 15.06.2023.
//

import UIKit
import MapKit

final class MapVC: UIViewController {
    
    @IBOutlet private weak var map: MKMapView!
    private let topSheet = SearchVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(topSheet)
        configureMap()
        configureTopSheet()
        configureBottomSheet()

    }
    
    private func configureMap() {
        map.showsUserLocation = true
    }
    
    private func configureBottomSheet() {
        let detail = DetailVC()
        let navigateDetail = UINavigationController(rootViewController: detail)
        
        navigateDetail.isModalInPresentation = true
        if let sheet = navigateDetail.sheetPresentationController {
            sheet.preferredCornerRadius = 40
            sheet.detents = [.custom(resolver: { context in
                0.05 * context.maximumDetentValue
            }), .large() ]
            sheet.prefersGrabberVisible = true
            sheet.largestUndimmedDetentIdentifier = .large
        }
        present(navigateDetail, animated: true)
        
    }
    
    private func configureTopSheet() {
//        let search = SearchVC()
//
//        let navigateSearch = UINavigationController(rootViewController: search)
//        navigateSearch.isModalInPresentation = true
//
//        if let sheet = navigateSearch.sheetPresentationController {
//            sheet.preferredCornerRadius = 40
//            sheet.detents = [.custom(resolver: { context in
//                0.2 * context.maximumDetentValue
//            }), .medium() ]
//            sheet.largestUndimmedDetentIdentifier = .large
//        }
//        search.modalPresentationStyle = .custom
//        search.transitioningDelegate = self
//        present(navigateSearch, animated: true)
        
    }
}


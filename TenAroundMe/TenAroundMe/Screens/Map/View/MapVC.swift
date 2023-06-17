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
    let topSheet = SearchVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        topSheet.modalPresentationStyle = .overFullScreen
        topSheet.modalTransitionStyle = .coverVertical
        addChild(topSheet)
        view.addSubview(topSheet.view)
        view.bringSubviewToFront(topSheet.topSheetView) // --> had no effect
        topSheet.topSheetView.isUserInteractionEnabled = true // --> seems false in the view debug
        topSheet.didMove(toParent: self)
        topSheet.view.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 0)
        // 👆🏼 crucial --> height: 0 part, otherwise map panning is blocked
    }

}



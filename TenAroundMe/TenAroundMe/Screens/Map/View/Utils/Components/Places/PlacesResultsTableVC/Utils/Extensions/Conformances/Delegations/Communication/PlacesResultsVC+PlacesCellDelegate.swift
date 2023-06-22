//
//  PlacesResultsVC+PlacesCellDelegate.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 19.06.2023.
//

import Foundation

extension PlacesResultsVC: PlacesCellDelegate {
    
    func buttonDetailPressed(at indexPath: IndexPath) {
        let place = self.places[indexPath.row]
        let detailVC = DetailVC(pass: self.viewModel, place: place.dataModel)
        present(detailVC, animated: true)
    }
}


//
//  PlacesResultsVC+UITableViewDatasource.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 19.06.2023.
//

import UIKit

extension PlacesResultsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: HardCoded.placesCell.get(), for: indexPath) as! PlacesCell
        let place = places[indexPath.row]
        cell.configure(with: place.dataModel)
        
        cell.backgroundColor = place.isFocused ? UIColor.lightGray.withAlphaComponent(0.5) : UIColor.clear
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Assemble the design for detail
        // TODO: Prefetch data based on autosuggestion and search
//        let place = places[indexPath.row]
//        let detailVC = DetailVC(place: place)
//        present(detailVC, animated: true)
    }

}

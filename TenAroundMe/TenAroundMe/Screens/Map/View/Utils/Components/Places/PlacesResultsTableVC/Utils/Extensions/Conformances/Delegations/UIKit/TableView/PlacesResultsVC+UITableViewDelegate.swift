//
//  PlacesResultsVC+UITableViewDelegate.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 19.06.2023.
//

import UIKit

extension PlacesResultsVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}

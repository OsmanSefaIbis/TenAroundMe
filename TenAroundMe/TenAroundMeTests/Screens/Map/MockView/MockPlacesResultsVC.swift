//
//  MockPlacesResultsView.swift
//  TenAroundMeTests
//
//  Created by Sefa İbiş on 23.06.2023.
//

import Foundation

@testable import TenAroundMe
import UIKit

final class MockPlacesResultsVC: PlacesResultsVCContract {
    
    /// invokation counters to track
    var counter_configureTableView = 0
    var counter_configureViewController = 0
    
    func configureTableView() {
        counter_configureTableView += 1
    }
    
    func configureViewController() {
        counter_configureViewController += 1
    }
    
}

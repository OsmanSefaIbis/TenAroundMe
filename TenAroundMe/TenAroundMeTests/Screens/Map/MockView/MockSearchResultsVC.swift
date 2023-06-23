//
//  MockSearchResultsVC.swift
//  TenAroundMeTests
//
//  Created by Sefa İbiş on 23.06.2023.
//

@testable import TenAroundMe
import UIKit

final class MockSearchResultsVC: SearchResultsVCContract {
    
    /// invokation counters to track 
    var counter_configureTableView = 0
    var counter_dumpData = 0
    var counter_startSpinner = 0
    var counter_stopSpinner = 0
    
    func configureTableView() {
        counter_configureTableView += 1
    }
    
    func dumpData() {
        counter_dumpData += 1
    }
    
    func startSpinner() {
        counter_startSpinner += 1
    }
    
    func stopSpinner() {
        counter_stopSpinner += 1
    }
}

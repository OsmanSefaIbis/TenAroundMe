//
//  MapVC+SearchVMDelegate.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 16.06.2023.
//

import Foundation

extension MapVC: SearchVMDelegate {
    
    func toggleUp(with index: Int) {
        topSheet.updateViewFrame(for: index)
    }
    
    func toggleDown(with index: Int) {
        topSheet.updateViewFrame(for: index)
    }
    
}

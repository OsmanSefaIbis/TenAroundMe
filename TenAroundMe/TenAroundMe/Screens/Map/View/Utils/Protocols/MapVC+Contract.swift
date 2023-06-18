//
//  MapVC+Contract.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 16.06.2023.
//

import Foundation

protocol MapVCContract: AnyObject {
    
    /// configureUI
    func configureMap()
    func configureSearchController()
    func configureBottomSheet()
    
}

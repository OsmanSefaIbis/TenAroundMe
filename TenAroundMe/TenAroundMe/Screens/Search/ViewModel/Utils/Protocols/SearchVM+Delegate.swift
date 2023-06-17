//
//  SearchVM+Delegate.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 16.06.2023.
//

import Foundation

protocol SearchVMDelegate: AnyObject {
    
    func toggleUp(with: Int)
    func toggleDown(with: Int)
}

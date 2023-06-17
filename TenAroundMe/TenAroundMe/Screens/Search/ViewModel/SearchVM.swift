//
//  SearchVM.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 16.06.2023.
//

import Foundation

final class SearchVM {
    
    weak var delegate: SearchVMDelegate?
    
    var currentFrameIndex: Int = 1
    
    func toggleUp() {
        if currentFrameIndex > 0 {
            currentFrameIndex -= 1
            delegate?.toggleUp(with: currentFrameIndex)
        }
    }

    func toggleDown() {
        if currentFrameIndex < 3 {
            currentFrameIndex += 1
            delegate?.toggleDown(with: currentFrameIndex)
        }
    }
}

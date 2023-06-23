//
//  MapVC+MapVMDelegate.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 16.06.2023.
//

import UIKit

extension MapVC: MapVMDelegate {
    
    func didRetrieveSuggest(_ data: [SuggestDataModel]) {
        setSuggestion(with: data)
    }
    
    func didRetrieveSearch(_ data: [PlacesDataModel]) {
        setPlaces(with: data)
    }
    
    func didConnectionHalt(_ prompt: String) {
        let alertController = UIAlertController(title: HardCoded.offLineAlertTitlePrompt.get(), message: prompt, preferredStyle: .alert )
        let okAction = UIAlertAction(title: HardCoded.offLineActionTitlePrompt.get(), style: .default)
        alertController.addAction(okAction)
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.present(alertController, animated: true)
        }
    }
    

}

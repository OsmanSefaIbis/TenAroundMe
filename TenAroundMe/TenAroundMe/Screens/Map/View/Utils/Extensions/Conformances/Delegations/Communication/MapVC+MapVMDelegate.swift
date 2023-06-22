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
        let okAction = UIAlertAction(title: HardCoded.offLineActionTitlePrompt.get(), style: .default) { [weak self] (action:UIAlertAction!) in
            guard let self else { return }
//            self.viewModel.reset() //TODO: later
        }
        alertController.addAction(okAction)
        DispatchQueue.main.async {
            self.present(alertController, animated: true)
        }
    }
    

}

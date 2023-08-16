//
//  SearchResultsVC+UITableViewDatasource.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 17.06.2023.
//

import UIKit

extension SearchResultsVC: UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.suggestionResultsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let resultCell = self.tableView.dequeueReusableCell(withIdentifier: HardCoded.searchCell.get()) as! SearchCell
        resultCell.indexPath = indexPath
        resultCell.configure(with: viewModel.suggestionResults[indexPath.row])
        
        return resultCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.mapView?.dismissPresentingSuggestionsList()
        let selectedRowIndex = indexPath.row
        let selectedData = viewModel.suggestionResults[selectedRowIndex]
        let selectedResultType = selectedData.resutlType
        viewModel.suggestionSelected(as: selectedResultType, with: selectedData)
    }

}


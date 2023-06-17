//
//  SearchResultsVC+UITableViewDatasource.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 17.06.2023.
//

import UIKit

extension SearchResultsVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.searchResultsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let resultCell = self.tableView.dequeueReusableCell(withIdentifier: "SearchCell") as! SearchCell
        resultCell.indexPath = indexPath
        resultCell.delegate = self
        resultCell.configure(with: viewModel.searchResults[indexPath.row])
        return resultCell
    }
    

}

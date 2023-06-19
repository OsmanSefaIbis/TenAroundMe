//
//  PlacesResultsVC.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 19.06.2023.
//

import UIKit
import MapKit

class PlacesResultsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MapVM!
    
    var places: [Places] // migrate to VM
    
    private var indexForFocusedRow: Int? { 
        places.firstIndex { $0.isFocused == true  }
    }
    
    init(with places: [Places], pass viewModel: MapVM) {
        self.places = places
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.viewModel.placesResultView = self
        self.places.swapAt(indexForFocusedRow ?? 0, 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.placesResultsView_viewDidLoad()
    }
}

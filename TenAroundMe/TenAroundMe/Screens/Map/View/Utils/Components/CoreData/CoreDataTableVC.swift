//
//  CoreData.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 21.06.2023.
//

import UIKit
import CoreData
import CoreLocation

// TODO: Make a viewController to edit persistent data

class CoreDataTableVC: UITableViewController {
    
    private(set) var persistentData: [UserLocationEntity] = []
    public var tableviewData: [CoreDataModel] = []
    
    var viewModel: MapVM!
    
    init(pass viewModel: MapVM) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.viewModel.coreDataResultView = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        tableviewSetup()
        initiateTableViewWithCoreData()
    }
    
    func testing(value test: Bool){
        if test {
            CoreDataModel.resetId()
            viewModel.coreDataDump()
        }
    }
    
    func initiateTableViewWithCoreData() {
        testing(value: false) /* To reset CoreData set true */
        viewModel.coreDataRetrieve(to: &persistentData)
        var dataFetchedFromCoreData: [CoreDataModel] = persistentData.map {
            .init(id: $0.id, latitude: $0.latitude, longitude: $0.longitude, timestamp: $0.timestamp ?? Date())
        }
        dataFetchedFromCoreData.sort { $0.id > $1.id }
        guard let mostRecentId = dataFetchedFromCoreData.first?.id else { return }
        viewModel.manuallySetID(with: mostRecentId)
        
        for each in dataFetchedFromCoreData {
            tableviewData.append(each)
        }
    }
    
    func tableviewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableviewData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        configure(with: tableviewData[indexPath.row], indexPath: indexPath)
    }
    
    func configure(with model: CoreDataModel, indexPath: IndexPath) -> UITableViewCell {
        var content = UITableViewCell().defaultContentConfiguration()
        content.prefersSideBySideTextAndSecondaryText = true
        content.text = "🌐 Lati:" + String(model.latitude) + "\t 🌐 Longi: " + String(model.longitude)
        content.textProperties.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        content.secondaryText = "⏰" + model.timestamp.formatted()
        content.secondaryTextProperties.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.contentConfiguration = content
        return cell
    }
    
}

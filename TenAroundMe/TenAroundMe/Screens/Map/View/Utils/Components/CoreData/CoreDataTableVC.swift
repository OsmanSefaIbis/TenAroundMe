//
//  CoreData.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 21.06.2023.
//
import UIKit

class CoreDataTableVC: UITableViewController {
    
    private var addButton: UIButton!
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
        configureDumpButton()
        tableviewSetup()
        initiateTableViewWithCoreData()
    }
    
    
    func initiateTableViewWithCoreData() {
        viewModel.coreDataRetrieve(to: &persistentData)
        var dataFetchedFromCoreData: [CoreDataModel] = persistentData.map {
            .init(id: $0.id, latitude: $0.latitude.formatCoordinateDouble(), longitude: $0.longitude.formatCoordinateDouble(), timestamp: $0.timestamp ?? Date())
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
        tableView.contentInset.bottom = addButton.bounds.height
    }
    
    func configureDumpButton() {
        addButton = UIButton(type: .system)
        addButton.setTitle("Dump", for: .normal)
        addButton.addTarget(self, action: #selector(dumpButtonPressed), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ])
    }
    
    @objc private func dumpButtonPressed() {
        viewModel.coreDataDump() /// Console 
        dismiss(animated: true)
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
        content.textProperties.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        content.secondaryText = " ⏰ " + model.timestamp.formatted()
        content.secondaryTextProperties.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.contentConfiguration = content
        
        return cell
    }
}

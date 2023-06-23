//
//  MapVM+Extension.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 16.06.2023.
//

import Foundation
import CoreData
import CoreLocation

extension MapVM {
        
    /// CRUD CoreData, left printouts on purpose

    func coreDataSave(with data: CoreDataModel, for location: CLLocation) {
        let context = appDelegate.persistentContainer.viewContext
        if let entity = NSEntityDescription.entity(forEntityName: "UserLocationEntity", in: context){
            
            let locationObject = NSManagedObject(entity: entity, insertInto: context)
            let timestamp = location.timestamp as NSDate
            locationObject.setValue(data.id, forKey: "id")
            locationObject.setValue(timestamp, forKey: "timestamp")
            locationObject.setValue(location.coordinate.latitude, forKey: "latitude")
            locationObject.setValue(location.coordinate.longitude, forKey: "longitude")
            do{
                coreDataInformCurrentData() /// console before
                try context.save()
                print(" ~~~~~~ CoreData: Data saved successfully! ~~~~~~ ")
                coreDataInformCurrentData() /// console after
            }catch{
                print("Error: Occured in saveToCoreData() with \(error)")
            }
        }
    }
    
    /// Unused but ready
    func coreDataUpdate(with data: CoreDataModel) {
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<UserLocationEntity> = UserLocationEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", "\(data.id)")
        do {
            let results = try context.fetch(fetchRequest)
            
            if let locationObject = results.first {
                let timestamp = data.timestamp as NSDate
                locationObject.setValue(timestamp, forKey: "timestamp")
                locationObject.setValue(data.latitude, forKey: "latitude")
                locationObject.setValue(data.longitude, forKey: "longitude")
            }
            try context.save()
            print(" ~~~~~~ CoreData: Data updated for id: \(data.id) successfully! ~~~~~~ \n")
            
        } catch {
            print("Error: Occured in updateDataInCoreData() with \(error) ")
        }
    }
    
    /// Unused but ready
    func coreDataDelete(with id: Int64){
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<UserLocationEntity>(entityName: "UserLocationEntity")
        fetchRequest.predicate = NSPredicate(format: "id == %@", "\(id)")
        do {
            let deleteEntity = try context.fetch(fetchRequest)
            for thisEntity in deleteEntity {
                context.delete(thisEntity)
            }
            try context.save()
            print(" ~~~~~~ CoreData: Data with id: \(id) is deleted successfully! ~~~~~~ \n")
        } catch {
            print("Error: Occured in deleteFromCoreData() with \(error) ")
        }
    }
    
    func coreDataRetrieve(to databaseData: inout [UserLocationEntity]) {
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<UserLocationEntity>(entityName: "UserLocationEntity")
        do{
            let result = try context.fetch(request)
            print(" ~~~~~~ CoreData - Total data count:  \(result.count) ~~~~~~ \n")
            databaseData = result
        }catch{
            print("Error: Occured in retrieveFromCoreData() with \(error) ")
        }
    }
    
    func coreDataInformCurrentData(){
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<UserLocationEntity>(entityName: "UserLocationEntity")
        do {
            let userLocationList = try context.fetch(fetchRequest)
            print("\n~~~~~~ CoreData ~~~~~~ Current ~~~~~~ Start\n")
            for (index, location) in userLocationList.enumerated() {
                print("Index: \(index+1) \t ID: \(location.id) \t TimeStamp: \(location.timestamp ?? Date()) \t Latitude: \(location.latitude) \t Longitude: \(location.longitude)")
            }
            print("\n~~~~~~ CoreData ~~~~~~ Current ~~~~~~ End\n")
        } catch let error as NSError {
            print("Error: Occured in listDataInCoreData() with \(error) ")
        }
    }
    
    func coreDataDump(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserLocationEntity")

        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        let persistentStoreCoordinator = appDelegate.persistentContainer.persistentStoreCoordinator

        do {
            try persistentStoreCoordinator.execute(batchDeleteRequest, with: appDelegate.persistentContainer.viewContext)
            print(" ~~~~~~ Core Data dumped ~~~~~~ \n")
            CoreDataModel.resetId()
        } catch {
            fatalError("Core Data dump gone bad ... ")
        }
    }
    
    func manuallySetID(with greatestCoreDataID: Int64) {
        let initiateWithID = greatestCoreDataID + 1
        CoreDataModel.setNextId(with: initiateWithID)
    }
    
    func modifyURLQueryString(_ urlString: String) -> String? {
        guard var urlComponents = URLComponents(string: urlString) else {
            return nil
        }
        
        let queryItems = urlComponents.queryItems?.map { item -> URLQueryItem in
            if item.name == "limit" {
                return URLQueryItem(name: item.name, value: "10")
            } else {
                return item
            }
        }

        urlComponents.queryItems = queryItems

        return urlComponents.url?.absoluteString
    }
}

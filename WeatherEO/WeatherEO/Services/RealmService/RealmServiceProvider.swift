//
//  RealmServiceProvider.swift
//  Sweety Weather
//
//  Created by Igor Kononov on 01.09.2023.
//

import Foundation
import RealmSwift

protocol RealmServiceProviding {
    func getCityWithID(id: String) -> CityModel?
    func addNewCityModel(city: CityModel)
    func deleteCityModel(city: CityModel)
}

class RealmServiceProvider: RealmServiceProviding {
    
    private let realmService = RealmService.shared
    
    private func getAllRealmServiceObjects<T: Object>() -> [T] {
        return Array(realmService.readAll(T.self))
    }
    
    //MARK: Сity
    
    private func getAllRealmObjects() -> [RealmCityModel] {
        return getAllRealmServiceObjects()
    }
    
    private func getRealmCityWithID(id: String) -> RealmCityModel? {
        return getAllRealmObjects().first(where: {$0.id == id}) ?? nil
    }
    
    private func getAllCityObjects() -> [CityModel] {
        getAllRealmObjects().map { realmModel in
            CityModel(id: realmModel.id, imageName: realmModel.imageName, isPremium: realmModel.isPremium, isOwnBg: realmModel.isOwnBg)
        }
    }
    
    func getCityWithID(id: String) -> CityModel? {
        getRealmCityWithID(id: id).map { realmModel in
            CityModel(id: realmModel.id, imageName: realmModel.imageName, isPremium: realmModel.isPremium, isOwnBg: realmModel.isOwnBg)
        }
    }
    
    func addNewCityModel(city: CityModel) {
        let model = RealmCityModel(id: city.id, isPremium: city.isPremium, isOwnBg: city.isOwnBg, imageName: city.imageName)
        self.realmService.create(model)
    }
        
    func deleteCityModel(city: CityModel) {
        guard let dbCity = getRealmCityWithID(id: city.id) else {
            print("Unable to find city")
            return
        }
        realmService.delete(dbCity)
    }
}

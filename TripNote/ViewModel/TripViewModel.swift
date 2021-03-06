//
//  TripViewModel.swift
//  TripNote
//
//  Created by win on 4/22/19.
//  Copyright © 2019 win. All rights reserved.
//

import Foundation
import RealmSwift

class TripViewModel {
    var realm = try! Realm()
    lazy var trips : Results<TripModel> = { [weak self] in
        self!.realm.objects(TripModel.self)
    }()
    func addTrip(trip : TripModel){
        try! realm.write {
            realm.add(trip, update: false)
        }
    }
    func getTrips() -> [TripModel] {
        return trips.map{$0}
    }
    func getTrip(atIndex : Int) -> TripModel {
        return trips[atIndex]
    }
    func getCount() -> Int {
        return trips.count
    }
    func deleteTrip(tripModel : TripModel){
        try! realm.write {
            realm.delete(tripModel)
        }
    }
    func updateTrip(tripModel : TripModel){
        try! realm.write {
            realm.add(tripModel, update: true)
        }
    }
    func getTripWithId(with Id : String) -> TripModel?{
        return self.realm.objects(TripModel.self).first(where : { $0.id == Id})
    }
}

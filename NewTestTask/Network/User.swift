//
//  User.swift
//  TestTask
//
//  Created by Паша on 8/28/20.
//  Copyright © 2020 Паша. All rights reserved.
//

import Foundation

typealias JSON = Dictionary<String, Any>

struct User {
    let id: String
    let vin: String
    let licencePlate: String?
    let licencePlateState: String?
    let mileage: Int
    let phone: String
    let shortUrl: String?
    let price: Int
    let createdAt: String
    let updatedAt: String
    let transmission: String
    let title: String
    let make: String
    let model: String
    let year: Int
    let trim: String
    let progress: Progress
    let images: [Image]
    let owner: Owner
    let addresses: [Address]
    
    init(json: JSON) {
        self.id =  json["id"] as! String
        self.vin =  json["vin"] as! String
        self.licencePlate = json["licence_plate"] as? String
        self.licencePlateState = json["licence_plate_state"] as? String
        self.mileage = json["mileage"] as! Int
        self.phone = json["phone"] as! String
        self.shortUrl = json["short_url"] as? String
        self.price = json["price"] as! Int
        self.createdAt = json["created_at"] as! String
        self.updatedAt = json["updated_at"] as! String
        self.transmission = json["transmission"] as! String
        self.title = json["title"] as! String
        self.make = json["make"] as! String
        self.model = json["model"] as! String
        self.year = json["year"] as! Int
        self.trim = json["trim"] as! String
        
        self.progress = Progress(json: json["progress"] as! JSON)
        self.images = (json["images"] as! [JSON]).map { Image(json: $0) }
        self.owner = Owner(json: json["owner"] as! JSON)
        self.addresses = (json["addresses"] as! [JSON]).map { Address(json: $0) }
    }
    
}

struct Progress {
    let current: Int
    let total: Int
    
    init(json: JSON) {
        self.current = json["current"] as! Int
        self.total = json["total"] as! Int
    }
    
}

struct Image {
    let id: String
    let uri: String
    
    init(json: JSON) {
        self.id = json["id"] as! String
        self.uri = (json["uri"] != nil ? json["uri"] : json["url"]) as! String
    }
}

struct Owner {
    let id: String
    let firstName: String
    let lastName: String
    let photoUrl: String
    let email: String?
    
    init(json: JSON) {
        self.id = json["id"] as! String
        self.firstName = json["first_name"] as! String
        self.lastName = json["last_name"] as! String
        self.photoUrl = json["photo_url"] as! String
        self.email = json["email"] as? String
    }
}

struct Address {
    let id: String?
    let city: String
    let state: String
    let zipcode: String
    let latitude: String
    let longitude: String
    
    init(json:JSON) {
        self.id = json["id"] as? String
        self.city = json["city"] as! String
        self.state = json["state"] as! String
        self.zipcode = json["zipcode"] as! String
        self.latitude = String(describing: json["latitude"])
        self.longitude = String(describing: json["longitude"])
    }
}

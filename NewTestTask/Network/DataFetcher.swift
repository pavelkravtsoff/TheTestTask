//
//  DataFetcher.swift
//  TestTask
//
//  Created by Паша on 8/28/20.
//  Copyright © 2020 Паша. All rights reserved.
//

import UIKit

enum FetchError: Error {
    case wrongUrl
    case wrongJsonData
    case wrongImageData
    case damageJsonData
    
    var localizedDescription: String {
        switch self {
        case .wrongUrl:
            return "You put in wrong URL"
        case .wrongJsonData:
            return "Unknown data"
        case .wrongImageData:
            return "Imagedata is damaged"
        case .damageJsonData:
            return "Unknown data was received"
        }
    }
}

final class DataFetcher {
    
    static let manager = DataFetcher()
    
    func fetchUsers(success: @escaping ([User]) -> Void, fail: @escaping (Error) -> Void) {
        
        guard let path = Bundle.main.path(forResource: "base", ofType: "json") else {
            fail(FetchError.wrongUrl)
            return
        }
        
        var users = [User]()
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let json  = try JSONSerialization.jsonObject(with: data, options: []) as! [JSON]
            for dict in json {
                let user = User(json: dict)
                users.append(user)
            }
            success(users)
        } catch let error {
            fail(error)
        }
    }
    
    func fetchImage(urlString: String, success: @escaping (UIImage?) -> Void, fail: ( (Error?) -> Void)?) {
        guard let url = URL(string: urlString) else {
            fail?(FetchError.wrongUrl)
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                fail?(error)
                return
            }
            
            guard let data = data,
                let image = UIImage(data: data) else {
                    fail?(FetchError.wrongJsonData)
                    return
            }
            
            success(image)
        }
        task.resume()
    }
    
}

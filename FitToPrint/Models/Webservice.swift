//
//  Webservice.swift
//  FitToPrint
//
//  Created by William Chapman on 8/23/19.
//  Copyright © 2019 William Chapman. All rights reserved.
//

import Foundation

struct Webservice {
    func loadHeadlines(url: URL, completion: @escaping ([Article]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            print("inside loadHeadlines...")
            guard let webData = data, error == nil else {
                completion(nil)
                return
            }
            
            let response = try? JSONDecoder().decode(NewsResponse.self, from: webData)
            print("valie Response?")
            if let validResponse = response {
                DispatchQueue.main.async {
                    completion(validResponse.articles)
                }
            }
        }.resume()
    }
}

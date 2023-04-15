//
//  SuperheroNetwork.swift
//  SuperheroAPI
//
//  Created by Belén Cerezo on 19/10/22.
//

import Foundation

struct SuperheroNetwork {

    private func performRequest(request: String, params: String?, completion: @escaping(([Superhero]?) -> ())) {

        var requestString = "https://akabab.github.io/superhero-api/api/\(request)"
        if let params = params {
            requestString = "\(requestString)\(params)"
        }

        let urlRequest = URLRequest(url: URL(string: requestString)!)

        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else {
                completion(nil)
                return
            }
            let decoder = JSONDecoder()

            do {
                let apiData = try decoder.decode([Superhero].self, from: data)
                completion(Array(apiData[0..<40]))
            } catch {
                completion(nil)
            }
        }

        task.resume()

    }
}

extension SuperheroNetwork: SuperheroNetworkProtocol {
    func getSuperhero(completion: @escaping([Superhero]?) -> ()) {
        performRequest(request: "all.json", params: nil, completion: completion)
    }
}

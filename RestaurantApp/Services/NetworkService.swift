//
//  NetworkService.swift
//  RestaurantApp
//
//  Copyright © 2019 Dmitx. All rights reserved.
//

import Foundation
import Moya

private let apiKey = "fol1vSC5rmeCnU7tQPLn0r-ICcfRLujNjOYtrC520F5wydROVZoXmgPT2vdPM8ZLyDcrgQMIpzWqZwK3bX8s-I10jAEl-WP53LKeuJ7a28PYy9oIlj57k6SRjNaXXHYx"

enum YelpService {
    enum BusinessesProvider: TargetType {
        case search(lat: Double, long: Double)
        case details(id: String)
        
        var baseURL: URL {
            return URL(string: "https://api.yelp.com/v3/businesses")!
        }

        var path: String {
            switch self {
            case .search:
                return "/search"
            case let .details(id):
                return "/\(id)"
            }
        }

        var method: Moya.Method {
            return .get
        }

        var sampleData: Data {
            return Data()
        }

        var task: Task {
            switch self {
            case let .search(lat, long):
                return .requestParameters(
                    parameters: ["latitude": lat, "longitude": long, "limit": 10], encoding: URLEncoding.queryString)
            case .details:
                return .requestPlain
            }
            
        }

        var headers: [String : String]? {
            return ["Authorization": "Bearer \(apiKey)"]
        }
    }
}

//
//  APICall.swift
//  SearchDoctor
//
//  Created by Iqbal Nur Haq on 25/01/24.
//

import Foundation

struct API {
    static let baseUrl = "https://api-dev.cexup.com/api/"
    static let xApiKey = "CXPKosQOPiuzREK22YUYUC4EuuFSKPyxPy"
}

protocol Endpoint {
    var url: String { get }
}

enum Endpoints {
    enum Gets: Endpoint {
        case doctor_list
        
        public var url: String {
            switch self {
                
            case .doctor_list:
                return "\(API.baseUrl)doctor"
            }
        }
    }
}

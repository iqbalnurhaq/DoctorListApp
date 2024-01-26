//
//  CustomError+Ext.swift
//  SearchDoctor
//
//  Created by Iqbal Nur Haq on 25/01/24.
//

import Foundation

enum URLError: LocalizedError {
    case invalidURL
    case addressUnreachable(URL)
    
    var errorDescription: String? {
        switch self {
            
        case .addressUnreachable(let url):
            return "\(url.absoluteString) is unreachable"
        case .invalidURL:
            return "Invalid URL"
        }
    }
}

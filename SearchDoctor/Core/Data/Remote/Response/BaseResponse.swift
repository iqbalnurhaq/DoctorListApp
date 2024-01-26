//
//  BaseResponse.swift
//  SearchDoctor
//
//  Created by Iqbal Nur Haq on 24/01/24.
//

import Foundation

struct BaseResponse<T: Decodable> {
    private enum CodingKeys: String, CodingKey {
        case code
        case success
        case message
        case data
    }
    
    let code: String
    let success: Bool
    let message: String
    let data: T
}

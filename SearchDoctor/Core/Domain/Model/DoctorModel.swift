//
//  DoctorModel.swift
//  SearchDoctor
//
//  Created by Iqbal Nur Haq on 25/01/24.
//

import Foundation

struct DoctorModel {
    
    let user_code: String
    let employee_id: Int
    let title: String
    let slug: String
    let description: String
    let speciality_id: Int
    let speciality: String
    let hospital: [HospitalModel]
    let thumb_original: String
    let thumb: String
    let is_available_now: Bool
    let isactived: Bool
    let email_verified_at: String
    let username: String
    let type: String
    let no_type: String
    let name: String
    let phone_number: String
    let email: String
    let date_of_birth: String
    let gender: String
    let provinsi: String
    let provinsi_id: String
    let kabupaten: String
    let kabupaten_id: String
    let kecamatan: String
    let kecamatan_id: String
    let desa: String
    let desa_id: String
    let address: String
    let review: ReviewModel
}


struct HospitalModel {
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case offline_price
        case online_price
        case online_price_details
    }
    
    let id: Int
    let name: String
    let offline_price: Int
    let online_price: Int
    let online_price_details: OnlinePriceDetailsModel
}

struct OnlinePriceDetailsModel {
    private enum CodingKeys: String, CodingKey {
        case consultation_price
        case admin_price
        case app_price
        case total_price
    }
    
    let consultation_price: Int
    let admin_price: Int
    let app_price: Int
    let total_price: Int
    
}

struct ReviewModel {
    let rating: Int
    let count_rating: Int
}


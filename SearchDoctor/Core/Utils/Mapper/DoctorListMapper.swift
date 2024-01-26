//
//  DoctorListMapper.swift
//  SearchDoctor
//
//  Created by Iqbal Nur Haq on 25/01/24.
//

import Foundation

class DoctorListMapper {
    func mapDoctorListResponseToDomain(_ responses: [DoctorResponse]) -> [DoctorModel] {
        return responses.map { result in
            let reviewModel = ReviewModel(
                rating: result.review.rating,
                count_rating: result.review.count_rating
            )
            
            let hospitalModel = result.hospital.map { hospital in
                
                let onlinePriceDetailsModel = OnlinePriceDetailsModel(
                    consultation_price: hospital.online_price_details.consultation_price,
                    admin_price: hospital.online_price_details.admin_price,
                    app_price: hospital.online_price_details.app_price,
                    total_price: hospital.online_price_details.total_price
                )
                
                return HospitalModel(
                    id: hospital.id,
                    name: hospital.name,
                    offline_price: hospital.offline_price,
                    online_price: hospital.online_price,
                    online_price_details: onlinePriceDetailsModel
                )
            }
            
            return DoctorModel(
                user_code: result.user_code,
                employee_id: result.employee_id,
                title: result.title,
                slug: result.slug,
                description: result.description,
                speciality_id: result.speciality_id,
                speciality: result.speciality,
                hospital: hospitalModel,
                thumb_original: result.thumb_original,
                thumb: result.thumb,
                is_available_now: result.is_available_now,
                isactived: result.isactived,
                email_verified_at: result.email_verified_at,
                username: result.username,
                type: result.type,
                no_type: result.no_type,
                name: result.name,
                phone_number: result.phone_number,
                email: result.email,
                date_of_birth: result.date_of_birth,
                gender: result.gender,
                provinsi: result.provinsi,
                provinsi_id: result.provinsi_id,
                kabupaten: result.kabupaten,
                kabupaten_id: result.kabupaten_id,
                kecamatan: result.kecamatan,
                kecamatan_id: result.kecamatan_id,
                desa: result.desa,
                desa_id: result.desa_id,
                address: result.address,
                review: reviewModel
            )
        }
    }
}

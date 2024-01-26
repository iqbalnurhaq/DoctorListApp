//
//  Injection.swift
//  SearchDoctor
//
//  Created by Iqbal Nur Haq on 25/01/24.
//

import Foundation

final class Injection: NSObject {
    
    
    let urlSession = URLSession.shared
    
    func provideRepository() -> DoctorRepositoryProtocol {
        let remote: DoctorRemoteDataSource = DoctorRemoteDataSource(urlSession: urlSession)
        return DoctorRespository(remote: remote)
    }
    
    func provideDoctorListInteractor() -> DoctorListUseCase {
        let repository = provideRepository()
        return DoctorListInteractor(repository: repository)
    }
    
}

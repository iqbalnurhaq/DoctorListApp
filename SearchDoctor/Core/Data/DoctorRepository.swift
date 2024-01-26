//
//  DoctorRepository.swift
//  SearchDoctor
//
//  Created by Iqbal Nur Haq on 25/01/24.
//

import Foundation
import RxSwift

protocol DoctorRepositoryProtocol: AnyObject {
    func getDoctorList() -> Observable<[DoctorModel]>
}

final class DoctorRespository: NSObject {
    
    typealias DoctorRespositoryInstance = (DoctorRemoteDataSourceProtocol) -> DoctorRespository
    let remote: DoctorRemoteDataSourceProtocol
    
    init(remote: DoctorRemoteDataSourceProtocol) {
        self.remote = remote
    }
    
    static let sharedInstance: DoctorRespositoryInstance = { remote in
        return DoctorRespository(remote: remote)
    }
    
}

extension DoctorRespository: DoctorRepositoryProtocol {
    func getDoctorList() -> Observable<[DoctorModel]> {
        return self.remote.getDoctorList()
            .map { DoctorListMapper().mapDoctorListResponseToDomain($0) }
    }
}



//
//  DoctorListInteractor.swift
//  SearchDoctor
//
//  Created by Iqbal Nur Haq on 25/01/24.
//

import Foundation
import RxSwift

protocol DoctorListUseCase {
    func getDoctorList() -> Observable<[DoctorModel]>
}

class DoctorListInteractor: DoctorListUseCase {

    let repository: DoctorRepositoryProtocol
    
    required init(repository: DoctorRepositoryProtocol) {
        self.repository = repository
    }
    
    func getDoctorList() -> Observable<[DoctorModel]> {
        return self.repository.getDoctorList()
    }
    
}

//
//  DoctorListViewModel.swift
//  SearchDoctor
//
//  Created by Iqbal Nur Haq on 25/01/24.
//

import Foundation
import RxSwift

class DoctorListViewModel {
    
    let useCase: DoctorListUseCase
    let disposeBag = DisposeBag()
    
    
    
    init(useCase: DoctorListUseCase) {
        self.useCase = useCase
    }
    
    
    
}

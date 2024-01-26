//
//  DoctorListRemoteDataSource.swift
//  SearchDoctor
//
//  Created by Iqbal Nur Haq on 25/01/24.
//

import Foundation
import RxSwift

protocol DoctorRemoteDataSourceProtocol : AnyObject {
    func getDoctorList() -> Observable<[DoctorResponse]>
}

final class DoctorRemoteDataSource: NSObject {
    typealias DoctorRemoteDataSourceInstance = (URLSession) -> DoctorRemoteDataSource
    
    let urlSession: URLSession
    
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    static let sharedInstance: DoctorRemoteDataSourceInstance = { session in
        DoctorRemoteDataSource(urlSession: session)
    }
}

extension DoctorRemoteDataSource: DoctorRemoteDataSourceProtocol {
    func getDoctorList() -> Observable<[DoctorResponse]> {
        return Observable.create { observer in
            guard let url = URL(string: Endpoints.Gets.doctor_list.url) else {
                observer.onError(
                    URLError.invalidURL
                )
                return
            }
            
            let request = URLRequest(url: url)
            request.setValue(API.xApiKey, forHTTPHeaderField: "x-api-key")
            
            let task = urlSession.dataTask(with: request) { data, response, error in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    observer.onError(
                        URLError.addressUnreachable(url)
                    )
                    return
                }
                
                do {
                    let doctor = try JSONDecoder().decode(BaseResponse<[DoctorResponse]>.self, from: data)
                    observer.onNext(doctor)
                    observer.onCompleted()
                } catch let error {
                    observer.onError(error)
                    return
                }
            }
            
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}

//  
//  DashboardInteractor.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit
import RxSwift

class DashboardInteractor {
    // TODO: Declare view methods
    weak var output: DashboardInteractorOutput!
    private var disposeBag = DisposeBag()
    
}

extension DashboardInteractor: DashboardUseCase {
    
    func loadImages() {
        APIClient.request(with: APIRouter.listImages(query: "natural"), codable: PixabayResponse.self)
        .asObservable()
            .subscribe(onNext: { response in
                if let hits = response.hits {
                    self.output.onLoadPixabay(hits)
                }
            }, onError: { error in
                self.output.onError(error)
            })
        .disposed(by: disposeBag)
    }
    
}

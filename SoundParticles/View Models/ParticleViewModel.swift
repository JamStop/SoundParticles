//
//  ParticleViewModel.swift
//  SoundParticles
//
//  Created by Jimmy Yue on 3/12/16.
//  Copyright © 2016 Jimmy Yue. All rights reserved.
//

import Foundation
import RxSwift

class ParticleViewModel {
    
    /**
     * Helpers + RxSwift
    */
    
    let disposeBag = DisposeBag()
    let helper = TAAEHelper()
    
    func test() {
        helper.rx_getMicrophoneBassFrequencies()
    }
    
}

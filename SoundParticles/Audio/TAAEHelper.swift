//
//  TAAEHelper.swift
//  SoundParticles
//
//  Created by Jimmy Yue on 3/12/16.
//  Copyright © 2016 Jimmy Yue. All rights reserved.
//

import Foundation
import TheAmazingAudioEngine
import RxSwift

/**
 * Helper class for TheAmazingAudioEngine
 * Initializes mic input, and passes audio observables everywhere
*/

class TAAEHelper {
    
    // MARK: - Properties
    
    /**
     * The audio controller acts as the general manager for your audio
     * Should automatically be dealloc'd by ARC
     * One for each frequency range due to limitations of filters
    */
    
    let bassController = AEAudioController(audioDescription: AEAudioStreamBasicDescriptionInterleaved16BitStereo, inputEnabled: true)
    
    
    // MARK: - Init
    
    init() {
        do {
            try bassController.start()
        } catch { return }
    }
    
    
    // MARK: - Functions
    
    /**
    * There are three different frequency listeners because this way is a bit more
    * clear in terms of audio organization, with a very very small hit to performance (negligeable
    * in iOS). Also, in terms of code structure, this is arguably cleaner.
    */
    
    func rx_getMicrophoneBassFrequencies() {
        let bassPlaythrough = AEPlaythroughChannel()
//        let lowPassComponent = AEAudioComponentDescriptionMake(kAudioUnitManufacturer_Apple, kAudioUnitType_Effect, kAudioUnitSubType_LowPassFilter)
        let lowPass = AELowPassFilter()
        lowPass.cutoffFrequency = 500
//        let lowPass = AEAudioUnitFilter(componentDescription: lowPassComponent)
        
        let bassReceiver = AEBlockAudioReceiver { (source, time, frames, audioBufferList) -> Void in
            print(audioBufferList[1].mBuffers.mData)
//            print(frames)
        }
        
        bassController.addInputReceiver(bassPlaythrough)
//        bassController.addInputReceiver(bassReceiver)
        bassController.addChannels([bassPlaythrough])
        bassController.addOutputReceiver(bassPlaythrough)
        bassController.addOutputReceiver(bassReceiver)
//        bassController.addInputFilter(lowPass)
        bassController.addFilter(lowPass)
        
        
    }
    
    func rx_getMicrophoneMidFrequencies() -> () {
//        let midPlaythrough = AEPlaythroughChann
        
    }
    
    func rx_getMicrophoneHighFrequencies() -> () {
        
    }
    
    
    
    
}

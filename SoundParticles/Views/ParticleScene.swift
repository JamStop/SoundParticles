//
//  ParticleScene.swift
//  SoundParticles
//
//  Created by Jimmy Yue on 3/12/16.
//  Copyright © 2016 Jimmy Yue. All rights reserved.
//

import UIKit
import SpriteKit

class ParticleScene: SKScene {
    
    // MARK: - Init
    
    override init(size: CGSize) {
        super.init(size: size)
        self.backgroundColor = SKColor.blackColor()
        
        guard let emitterPath = NSBundle.mainBundle().pathForResource("BokehParticle", ofType: "sks") else {
            fatalError("Emitter retrieval failed")
        }
        
        guard let bokeh = NSKeyedUnarchiver.unarchiveObjectWithFile(emitterPath) as? SKEmitterNode else { fatalError("Couldn't unarchive node")
        }
        
        bokeh.position = CGPointMake(self.size.width/2, self.size.height/2)
        bokeh.name = "particleBokeh"
        self.addChild(bokeh)
        
//        bokeh.particleRotationSpeed = 0.0
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

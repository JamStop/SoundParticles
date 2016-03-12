//
//  ParticleView.swift
//  SoundParticles
//
//  Created by Jimmy Yue on 3/12/16.
//  Copyright © 2016 Jimmy Yue. All rights reserved.
//

import UIKit
import SpriteKit

class ParticleView: UIView {
    
    // MARK: - Properties
    
    @IBOutlet weak var particleBackground: SKView!
    
    // MARK: - Init
    
    override func awakeFromNib() {
        setupParticles()
    }
    
    private func setupParticles() {
        let scene = ParticleScene(size: particleBackground.bounds.size)
        scene.scaleMode = SKSceneScaleMode.AspectFill
        particleBackground.presentScene(scene)
    }
}

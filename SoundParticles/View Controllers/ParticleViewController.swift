//
//  ParticleViewController.swift
//  SoundParticles
//
//  Created by Jimmy Yue on 3/12/16.
//  Copyright © 2016 Jimmy Yue. All rights reserved.
//

import UIKit

class ParticleViewController: UIViewController {
    
    // MARK: - Properties (view and view model)
    
    @IBOutlet weak var mainView: ParticleView!
    let viewModel = ParticleViewModel()
    
    
    // MARK: - View Controller Overrides

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.test()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

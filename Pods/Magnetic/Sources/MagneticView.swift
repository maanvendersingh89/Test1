//
//  MagneticView.swift
//  Magnetic
//
//  Created by Lasha Efremidze on 3/28/17.
//  Copyright © 2017 efremidze. All rights reserved.
//

import SpriteKit

public class MagneticView: SKView {
    
    @objc
    public lazy var magnetic: Magnetic = { [unowned self] in
        let scene = Magnetic(size: self.bounds.size)
        self.presentScene(scene)
        return scene
    }()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    func commonInit() {
        accessibilityCreateSelectionRotor(withName: "Selected", usingScene: magnetic)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        magnetic.size = bounds.size
        magnetic.backgroundColor = UIColor(red: 63/255, green: 69/255, blue: 88/255, alpha: 1)
    }
    
}

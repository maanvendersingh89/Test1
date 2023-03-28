//
//  Extensions.swift
//  Magnetic
//
//  Created by Lasha Efremidze on 3/25/17.
//  Copyright © 2017 efremidze. All rights reserved.
//

import SpriteKit

extension CGFloat {
    static func random(_ lower: CGFloat = 0, _ upper: CGFloat = 1) -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * (upper - lower) + lower
    }
}

extension CGPoint {
    func distance(from point: CGPoint) -> CGFloat {
        return hypot(point.x - x, point.y - y)
    }
}

extension UIImage {
    func aspectFill(_ size: CGSize) -> UIImage {
        let aspectWidth = size.width / self.size.width
        let aspectHeight = size.height / self.size.height
        let aspectRatio = max(aspectWidth, aspectHeight)
        
        var newSize = self.size
        newSize.width *= aspectRatio
        newSize.height *= aspectRatio
        return resize(newSize)
    }
    func resize(_ size: CGSize) -> UIImage {
        var rect = CGRect.zero
        rect.size = size
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

public extension UICollectionView{
    
    func setUIedge(numberOfItem: Int){
        if numberOfItem == 1{
            self.contentInset = UIEdgeInsets(top: 0, left: self.frame.size.width/2-50, bottom: 0, right: 0)
        }
       else if numberOfItem == 2{
           self.contentInset = UIEdgeInsets(top: 0, left: (self.frame.size.width/2)/2, bottom: 0, right: 0)
        }
        else{
            self.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
}

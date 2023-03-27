//
//  CircleViewModel.swift
//  LetsTrackTest
//
//  Created by Apple on 23/03/23.
//

import Foundation

protocol CircleListDelegate: AnyObject {
    func circleListDidUpdate()
}

class CircleViewModel: NSObject {
  
    
  
    var delegate: CircleListDelegate?
    private var network : Network!
    var circleData : CircleModel!

    
    override init() {
        super.init()
        self.network = Network()
        getCircleData()
    }
    
    func getCircleData() {
        self.network.apiToGetCircleData { (circleData) in
            self.circleData = circleData
            self.delegate?.circleListDidUpdate()
        }
    }
    
    
}

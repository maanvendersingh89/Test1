//
//  CircleViewModel.swift
//  LetsTrackTest
//
//  Created by Apple on 23/03/23.
//

import Foundation
import UIKit

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
    
    func animateAndPush(circleDate: CircleList,vc: UIViewController,cell: UICollectionViewCell){
        //Briefly fade the cell on selection
        UIView.animate(withDuration: 0.5,
                       animations: {
                        //Fade-out
                   
            cell.transform = cell.transform.scaledBy(x: 0.75, y: 0.75)
        }) { (completed) in
            cell.transform = cell.transform.scaledBy(x: 1.2, y: 1.2)
            UIView.animate(withDuration: 0.5,
                           animations: {
                            //Fade-out
                       
                cell.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
            }) { (completed) in
                cell.transform = cell.transform.scaledBy(x: 1, y: 1)
                UIView.animate(withDuration: 0.5,
                               animations: {
                                //Fade-out
                           
                    cell.transform = CGAffineTransform.identity.scaledBy(x: 0.80, y: 0.80)
                }) { (completed) in
                    cell.transform = cell.transform.scaledBy(x: 1, y: 1)
                    let circleMapVC = vc.storyboard?.instantiateViewController(withIdentifier: "CircleMapVC") as! CircleMapVC
                   
                    circleMapVC.circleList = circleDate
                    vc.navigationController?.pushViewController(circleMapVC, animated: true)
                }
                
            }

        }
    }
    
}

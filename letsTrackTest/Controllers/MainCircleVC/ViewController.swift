//
//  ViewController.swift
//  LetsTrackTest
//
//  Created by Apple on 23/03/23.
//

import UIKit
import Magnetic
import SpriteKit

class ViewController: UIViewController, MagneticDelegate, CircleListDelegate {
    
    
   
    @IBOutlet weak var magneticView: MagneticView! {
        didSet {
            magnetic.magneticDelegate = self
            magnetic.removeNodeOnLongPress = true
            magnetic.magneticField.animationSpeed = 0
        }
    }
    var magnetic: Magnetic {
        return magneticView.magnetic
    }
    
    
    

    @IBOutlet weak var bubbleCollectionView: UICollectionView!
    var circleViewModel = CircleViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
    }
    override func viewWillDisappear(_ animated: Bool) {
        magneticView.magnetic.reset()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.circleViewModel.delegate = self
        self.circleViewModel.getCircleData()
      
    }
    
    func circleListDidUpdate() {
      
        for i in 0...(circleViewModel.circleData.circleList?.count ?? 0){
            if i == 0 {
                let node = Node(text: "You",circleId: 0,count: "",isexpired: false, image: UIImage(named: ""), color: UIColor.white, radius: 100)
                node.scaleToFitContent = true
                node.label.fontColor = UIColor.black
                node.label.fontSize =  15
                node.name = "you"
               // node.selectedColor = UIColor.white
                magnetic.addChild(node)
            }
           else
            {
               let data = circleViewModel.circleData.circleList?[i-1]
               let colorCode = circleViewModel.circleData.circleList?[i-1].circleColorCode ?? "#FFD34A"
               let memberCount = circleViewModel.circleData.circleList?[i-1].memberCount ?? 0
               let isExpired = circleViewModel.circleData.circleList?[i-1].isExpired ?? false
               let circleId = circleViewModel.circleData.circleList?[i-1].circleId ?? 0
               let color = UIColor(hex: colorCode) 
               let node = Node(text: data?.circleName,circleId: circleId,count: "\(memberCount)", isexpired: isExpired, image: UIImage(named: ""), color: color, radius: 45)
               node.scaleToFitContent = true
               node.isExpired = isExpired
               node.name = "\(circleId)"
              // node.selectedColor = UIColor.red
               magnetic.addChild(node)
           }
        }

        
    }
   
    
    func magnetic(_ magnetic: Magnetic, didSelect node: Node) {
        print("didSelect -> \(node)")
        let CircleMapVC = self.storyboard?.instantiateViewController(withIdentifier: "CircleMapVC") as! CircleMapVC
        self.navigationController?.pushViewController(CircleMapVC, animated: true)
    }
    
    func magnetic(_ magnetic: Magnetic, didDeselect node: Node) {
        print("didDeselect -> \(node)")
    }
    
    func magnetic(_ magnetic: Magnetic, didRemove node: Node) {
        print("didRemove -> \(node)")
    }
    
    
    
}


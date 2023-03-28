//
//  CircleVC.swift
//  LetsTrackTest
//
//  Created by Apple on 28/03/23.
//

import UIKit
import WatchLayout
import SwiftUI

class CircleVC: UIViewController, CircleListDelegate {
    
    
    @IBOutlet weak var bubbleCollectionView: UICollectionView!
    private let refreshControl = UIRefreshControl()
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    var circleViewModel = CircleViewModel()
    
    let columnLayout = FlowLayout(
           itemSize: CGSize(width: 140, height: 140),
           minimumInteritemSpacing: 10,
           minimumLineSpacing: 10,
           sectionInset: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
       )
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
        self.circleViewModel.delegate = self
        self.circleViewModel.getCircleData()
        
        bubbleCollectionView.register(UINib.init(nibName: "BubbleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BubbleCollectionViewCell")
       
        // Add Refresh Control to collection View
        if #available(iOS 10.0, *) {
            bubbleCollectionView.refreshControl = refreshControl
        } else {
            bubbleCollectionView.addSubview(refreshControl)
        }
        refreshControl.tintColor = .red
        
        refreshControl.addTarget(self, action: #selector(refreshWeatherData(_:)), for: .valueChanged)
        bubbleCollectionView.collectionViewLayout = columnLayout

        bubbleCollectionView?.backgroundColor = .clear
        bubbleCollectionView?.contentInsetAdjustmentBehavior = .always
    }
    @objc private func refreshWeatherData(_ sender: Any) {
        self.circleViewModel.circleData.circleList = []
        self.circleViewModel.getCircleData()
        refreshControl.endRefreshing()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.bubbleCollectionView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    func circleListDidUpdate() {
     var circleListArray =  circleViewModel.circleData.circleList
        let circleListItem = CircleList(circleId: 0, circleName: "You", circleColorCode: "#FFFFFF", circleType: "", isActive: 1, isPersonal: true, isExpired: false, memberCount: 0, totalTimeSlot: 0, createdDate: 0, noOfVisits: 0)
        if circleListArray?.count ?? 0 > 3{
            circleListArray?.insert(circleListItem, at: 3)
        }
        else{
           circleListArray?.insert(circleListItem, at: 0)
        }
        
        circleViewModel.circleData.circleList = circleListArray
        
        self.bubbleCollectionView.reloadData()
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?){
        if(keyPath == "contentSize"){
            if let tbl = object as? UICollectionView{
                if tbl == self.bubbleCollectionView{
                    if let newvalue = change?[.newKey] {
                        let newsize = newvalue as! CGSize
                        if newsize.height + 20 < self.view.frame.size.height{
                            self.collectionViewHeight.constant = newsize.height + 20
                        }
                        else{
                            self.collectionViewHeight.constant = self.view.frame.size.height-30
                        }
                       
                    }
                }
            }
        }
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
       super.viewWillDisappear(animated)
        self.bubbleCollectionView.removeObserver(self, forKeyPath: "contentSize")
    }
    
    
    
}

// MARK: UICollectionViewDataSource

extension CircleVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return (circleViewModel.circleData.circleList?.count ?? 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BubbleCollectionViewCell", for: indexPath) as! BubbleCollectionViewCell
        
        let data = circleViewModel.circleData.circleList?[indexPath.row]
        let circleName = data?.circleName ?? ""
        if circleName.lowercased() == "you"
        {
            let data = circleViewModel.circleData.circleList?[indexPath.row]
            let colorCode = data?.circleColorCode ?? "#FFD34A"
            let isExpired = data?.isExpired ?? false
            let color = UIColor(hex: colorCode)
            let circleName = data?.circleName ?? ""
            cell.backgroundColor = color
            cell.lblMemberCount.text = ""
            cell.expiredBackView = cell.expiredBackView.setBackView(isExpired: true)
            cell.lblCircleName.text = circleName
            cell.lblCircleName.textColor = .black
            cell.lblCircleName.font = UIFont.boldSystemFont(ofSize: 20)
            cell.bottomLblConstraint.constant = 20
        }
        else{
            let data = circleViewModel.circleData.circleList?[indexPath.row]
            let colorCode = data?.circleColorCode ?? "#FFD34A"
            let memberCount = data?.memberCount ?? 0
            let isExpired = data?.isExpired ?? false
            let color = UIColor(hex: colorCode)
            let circleName = data?.circleName ?? ""
            cell.lblCircleName.font = UIFont.systemFont(ofSize: 15)
            if isExpired {
                cell.expiredBackView.layer.cornerRadius = 5
                cell.expiredBackView.backgroundColor = .red
                cell.expiredBackView.layer.borderWidth = 0
                cell.expiredBackView.layer.borderColor = UIColor.clear.cgColor
                cell.lblMemberCount.text = "Expired"
                cell.xConstraint.constant = -6
                cell.widthConstraint.constant = 6
            }
            else{
                cell.expiredBackView.layer.cornerRadius = 10
                cell.expiredBackView.backgroundColor = .clear
                cell.expiredBackView.layer.borderWidth = 1
                cell.expiredBackView.layer.borderColor = UIColor.lightGray.cgColor
                cell.xConstraint.constant = -12
                cell.widthConstraint.constant = 12
                cell.lblMemberCount.text = "\(memberCount)"
            }
            cell.lblCircleName.textColor = .white
            cell.backgroundColor = color
            cell.lblCircleName.text = circleName
            
        }
           
           
        cell.layer.cornerRadius = cell.frame.size.width/2
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        guard let data = self.circleViewModel.circleData.circleList?[indexPath.row] else { return  }
        circleViewModel.animateAndPush(circleDate: data, vc: self,cell: cell)
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
        let data = circleViewModel.circleData.circleList?[indexPath.row]
        let radius = (data?.memberCount ?? 0)*10
        
        let width = Int((collectionView.frame.width/4))-10
        
        return CGSize(width: width+radius, height: width+radius)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
           let cellWidth: CGFloat = flowLayout.itemSize.width - 30
           let cellSpacing: CGFloat = 10
           var cellCount = CGFloat(collectionView.numberOfItems(inSection: section))
           var collectionWidth = collectionView.frame.size.width
           var totalWidth: CGFloat
           if #available(iOS 11.0, *) {
               collectionWidth -= collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right
           }
           repeat {
               totalWidth = cellWidth * cellCount + cellSpacing * (cellCount - 1)
               cellCount -= 1
           } while totalWidth >= collectionWidth

           if (totalWidth > 0) {
               let edgeInset = (collectionWidth - totalWidth) / 2
               return UIEdgeInsets.init(top: 0, left: edgeInset, bottom: 0, right: edgeInset)
           } else {
               return flowLayout.sectionInset
           }
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
}

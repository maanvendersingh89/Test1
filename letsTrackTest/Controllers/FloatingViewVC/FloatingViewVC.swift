//
//  FloatingViewVC.swift
//  LetsTrackTest
//
//  Created by Apple on 25/03/23.
//

import UIKit

class FloatingViewVC: UIViewController,CircleMapMemberDelegate {
   
    public static let INSTANCE=FloatingViewVC()
    @IBOutlet weak var mainTableView: UITableView!
    var circleMapViewModel = CircleMapViewModel()
    @IBOutlet weak var lblCircleName: UILabel!
    @IBOutlet weak var lblTimeTracking: UILabel!
    @IBOutlet weak var btnMemberImage: UIButton!
    @IBOutlet weak var btnMapView: UIButton!
    var imageOnMap = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        // Do any additional setup after loading the view.
        mainTableView.register(UINib.init(nibName: "FloatingViewTVCell", bundle: nil), forCellReuseIdentifier: "FloatingViewTVCell")
        let totalDevices = (circleMapViewModel.membersModel.deviceDetails?.count ?? 0) + (circleMapViewModel.membersModel.userDetail?.count ?? 0) + (circleMapViewModel.membersModel.myBleTag?.count ?? 0)
        let circleName = circleMapViewModel.membersModel.circleDetail?[0].circleName ?? ""
        lblCircleName.text = "\(circleName)(\(totalDevices))"
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.circleMapViewModel.getCircleMemberData()
        self.circleMapViewModel.delegate = self
      
    }
    
    
    @IBAction func action_btnMemberImageTapped(_ sender: UIButton) {
        
        ImagePickerManager().pickImage(self){ image,path  in
            print(path)
            NotificationCenter.default.post(name: Notification.Name("setImageOnMap"), object: [ "image": image])
           // let compressedImage = image.jpegData(compressionQuality: 0.5) ?? Data()
        }
        
    }
 
    func circleMemberDidUpdate() {
        mainTableView.reloadData()
    }

}

//


import UIKit

class CameraBarButton: UIBarButtonItem {
    
    func activeFrontCamera(_ active: Bool) {
        
        if active {
            
            image = UIImage.init(named: "ic_camera_rear_white")!
            
        } else {
            
            image = UIImage.init(named: "ic_camera_front_white")!
        }
    }

}

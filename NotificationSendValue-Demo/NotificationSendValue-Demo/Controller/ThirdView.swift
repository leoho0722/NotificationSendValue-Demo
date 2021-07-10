import UIKit

class ThirdView: UIViewController {

    @IBOutlet var thirdViewSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(alert(notification:)), name: .thirdViewToFirstView, object: nil)
    }
    
    @IBAction func pushNotificationToFirstView(_ sender: UIButton) {
        NotificationCenter.default.post(name: .thirdViewToFirstView, object: nil)
    }
    
    @IBAction func goToFirstView(_ sender: UIButton) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "FirstView") {
            controller.modalTransitionStyle = .flipHorizontal
            controller.modalPresentationStyle = .fullScreen
            self.present(controller,animated: true)
        }
    }
    
    @objc func alert(notification: Notification) {
        thirdViewSwitch.isOn = !(thirdViewSwitch.isOn)
    }
}

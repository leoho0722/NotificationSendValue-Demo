import UIKit

class SecondView: UIViewController {

    @IBOutlet var secondViewSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(alert(notification:)), name: .secondViewToThirdView, object: nil)
    }
    
    @IBAction func pushNotificationToThirdView(_ sender: UIButton) {
        NotificationCenter.default.post(name: .secondViewToThirdView, object: nil)
    }
    
    @IBAction func goToThirdView(_ sender: UIButton) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "ThirdView") {
            controller.modalTransitionStyle = .flipHorizontal
            self.present(controller,animated: true)
        }
    }
    
    @objc func alert(notification: Notification) {
        secondViewSwitch.isOn = !(secondViewSwitch.isOn)
    }
}

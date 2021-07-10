import UIKit

class FirstView: UIViewController {

    @IBOutlet var firstViewSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(alert(notification:)), name: .firstViewToSecondView, object: nil)
    }

    @IBAction func pushNotificationToSecondView(_ sender: UIButton) {
        NotificationCenter.default.post(name: .firstViewToSecondView, object: nil)
    }
    
    @IBAction func goToSecondView(_ sender: UIButton) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "SecondView") {
            controller.modalTransitionStyle = .flipHorizontal
            self.present(controller,animated: true)
        }
    }
    
    @objc func alert(notification: Notification) {
        firstViewSwitch.isOn = !(firstViewSwitch.isOn)
    }
}



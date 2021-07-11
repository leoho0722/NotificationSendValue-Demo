import UIKit

class ThirdView: UIViewController {
    
    @IBOutlet var thirdViewSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.post(name: .thirdViewToSecondView, object: nil) // 發送第二畫面 UISwitch 狀態變更的 Post 訊號
    }
    
    @IBAction func createThirdViewObserver(_ sender: UIButton) {
        // 建立第三畫面的 Observer，當跳頁到第一畫面後，第三畫面會接收到第一畫面發送給 NotificationCenter 的廣播訊號
        NotificationCenter.default.addObserver(self, selector: #selector(alert(notification:)), name: .firstViewToThirdView, object: nil)
        print("已建立第三畫面的 Observer！\n")
    }
    
    @IBAction func goToFirstView(_ sender: UIButton) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "FirstView") {
            controller.modalTransitionStyle = .flipHorizontal
            controller.modalPresentationStyle = .fullScreen
            self.present(controller,animated: true)
        }
    }
    
    // Observer 從 NotificationCenter 收到廣播訊號 (Notification.Name = firstViewToThirdView)後，selector 要執行的 function
    @objc func alert(notification: Notification) {
        thirdViewSwitch.isOn = !(thirdViewSwitch.isOn)
    }
}

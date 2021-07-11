import UIKit

class SecondView: UIViewController {

    @IBOutlet var secondViewSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.post(name: .secondViewToFirstView, object: nil) // 發送第一畫面 UISwitch 狀態變更的 Post 訊號
    }
    
    @IBAction func createSecondViewObserver(_ sender: UIButton) {
        // 建立第二畫面的 Observer，當跳頁到第三畫面後，第二畫面會接收到第三畫面發送給 NotificationCenter 的廣播訊號
        NotificationCenter.default.addObserver(self, selector: #selector(alert(notification:)), name: .thirdViewToSecondView, object: nil)
        print("已建立第二畫面的 Observer！\n")
    }
    
    @IBAction func goToThirdView(_ sender: UIButton) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "ThirdView") {
            controller.modalTransitionStyle = .flipHorizontal
            self.present(controller,animated: true)
        }
    }
    
    // Observer 從 NotificationCenter 收到廣播訊號 (Notification.Name = thirdViewToSecondView)後，selector 要執行的 function
    @objc func alert(notification: Notification) {
        secondViewSwitch.isOn = !(secondViewSwitch.isOn)
    }
}

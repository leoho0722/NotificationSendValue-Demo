import UIKit

class FirstView: UIViewController {

    @IBOutlet var firstViewSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.post(name: .firstViewToThirdView, object: nil) // 發送第三畫面 UISwitch 狀態變更的 Post 訊號
    }

    @IBAction func createFirstViewObserver(_ sender: UIButton) {
        // 建立第一畫面的 Observer，當跳頁到第二畫面後，第一畫面會接收到第二畫面發送給 NotificationCenter 的廣播訊號
        NotificationCenter.default.addObserver(self, selector: #selector(alert(notification:)), name: .secondViewToFirstView, object: nil)
        print("已建立第一畫面的 Observer！\n")
    }
    
    @IBAction func goToSecondView(_ sender: UIButton) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "SecondView") {
            controller.modalTransitionStyle = .flipHorizontal
            self.present(controller,animated: true)
        }
    }
    
    // Observer 從 NotificationCenter 收到廣播訊號 (Notification.Name = secondViewToFirstView)後，selector 要執行的 function
    @objc func alert(notification: Notification) {
        firstViewSwitch.isOn = !(firstViewSwitch.isOn)
    }
}

/*
 1.先註冊一個 Observer、Notification.Name
 2.Post 一個 Notification 廣播給 NotificationCenter，該廣播的 Notification.Name 與 Observer 的 Notification.Name 需一致
 3.Observer 從 NotificationCenter 那接收到 Post 所發出的 Notification 廣播後，執行 selector 的 function
 
 參考來源：https://learnappmaking.com/notification-center-how-to-swift/
 */

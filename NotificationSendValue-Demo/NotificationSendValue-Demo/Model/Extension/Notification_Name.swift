import Foundation

extension Notification.Name {
    static let firstViewToSecondView = Notification.Name("FirstViewToSecondView") // 第一畫面傳給第二畫面
    static let secondViewToThirdView = Notification.Name("SecondViewToThirdView") // 第二畫面傳給第三畫面
    static let thirdViewToFirstView = Notification.Name("ThirdViewToFirstView") // 第三畫面傳給第一畫面
}

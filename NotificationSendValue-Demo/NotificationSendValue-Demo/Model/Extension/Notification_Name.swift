import Foundation

extension Notification.Name {
    static let secondViewToFirstView = Notification.Name("SecondViewToFirstView") // 第二畫面傳給第一畫面
    static let thirdViewToSecondView = Notification.Name("ThirdViewToSecondView") // 第三畫面傳給第二畫面
    static let firstViewToThirdView = Notification.Name("FirstViewToThirdView") // 第一畫面傳給第三畫面
}

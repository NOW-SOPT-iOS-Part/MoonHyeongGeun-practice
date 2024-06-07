import Foundation

struct SignUpRequestModel: Codable { //1번: Codable 할 수 있게 Swift->Json으로 변환, typealias
    let authenticationId: String
    let password: String
    let nickname: String
    let phone: String
}

import Foundation

import Moya


enum UserTargetType { // 2번: 서버통신 요청서 작성 과정, enum 통해 분기처리, api 문서 정보를 넣어주는 것
    case getUserInfo(memberId: String)
    case signUp(request: SignUpRequestModel)
}

extension UserTargetType: TargetType {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        switch self {
        case .signUp:
            return "/member/join"
        case .getUserInfo(memberId: let memberId):
            return "/member/info"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signUp:
            return .post
        case .getUserInfo:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .signUp(let request):
            return .requestJSONEncodable(request)
        case .getUserInfo:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case.signUp:
            return ["Content-Type": "application/json"]
        case .getUserInfo(let memberId):
            return ["Content-Type": "application/json",
                    "memberId" : memberId]
        }
        
    }
}


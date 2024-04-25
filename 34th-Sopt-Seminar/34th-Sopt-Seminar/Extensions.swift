import UIKit

//Font 커스텀
extension UIFont {
    static func pretendardFont(weight: CGFloat, size: CGFloat) -> UIFont {
            let fontName: String
            switch weight {
                case 100:
                    fontName = "Pretendard-Thin"
                case 200:
                    fontName = "Pretendard-ExtraLight"
                case 300:
                    fontName = "Pretendard-Light"
                case 400:
                    fontName = "Pretendard-Regular"
                case 500:
                    fontName = "Pretendard-Medium"
                case 600:
                    fontName = "Pretendard-SemiBold"
                case 700:
                    fontName = "Pretendard-Bold"
                case 800:
                    fontName = "Pretendard-ExtraBold"
                case 900:
                    fontName = "Pretendard-Black"
                default:
                    fatalError("Invalid weight")
            }
            guard let font = UIFont(name: fontName, size: size) else {
                fatalError("Font not found")
            }
            return font
        }
}

//Button 커스텀
extension UIButton {
    func makeRoundBorder(cornerRadius: CGFloat) {
        layer.masksToBounds = true //뷰의 경계를 넘어서는 부분(서브뷰, 이미지, 텍스트 등)을 잘라내는 역할
        layer.cornerRadius = cornerRadius
    }
}

//TextField 커스텀
extension UITextField {
    func setTextField(forPlaceholder: String, forCornerRadius: CGFloat? = nil) {
      self.clipsToBounds = true
      self.placeholder = forPlaceholder

      if let cornerRadius = forCornerRadius {
          self.layer.cornerRadius = cornerRadius
      }  else {
          self.layer.cornerRadius = 0
      }
    }
    
    //placeholder 커스텀
    func setPlaceholder(placeholder: String, fontColor: UIColor?, font: UIFont) {
    self.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                    attributes: [.foregroundColor: fontColor!,
                                                                 .font: font])
    }
    
    //TextField Padding 커스텀
    func addPadding(left: CGFloat? = nil, right: CGFloat? = nil) {
        if let left {
            leftView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: 0))
            leftViewMode = .always
        }
        if let right {
            rightView = UIView(frame: CGRect(x: 0, y: 0, width: right, height: 0))
            rightViewMode = .always
        }
    }
}

//Subviews 일괄 추가
extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}


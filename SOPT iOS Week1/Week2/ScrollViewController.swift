import UIKit
import Then
import SnapKit

final class ScrollViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let redView = UIView().then {
        $0.backgroundColor = .red
    }
    private let orangeView = UIView().then {
        $0.backgroundColor = .orange
    }
    private let yellowView = UIView().then {
        $0.backgroundColor = .yellow
    }
    private let greenView = UIView().then {
        $0.backgroundColor = .green
    }
    private let blueView = UIView().then {
        $0.backgroundColor = .blue
    }
    private let purpleView = UIView().then {
        $0.backgroundColor = .purple
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setLayout()
    }

    private func setLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [redView, orangeView, yellowView, greenView, blueView, purpleView].forEach {
            contentView.addSubview($0)
        }
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.bottom.equalTo(purpleView.snp.bottom)
        }

        redView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.height.equalTo(400)
            $0.width.equalTo(UIScreen.main.bounds.size.width / 2)
        }
        orangeView.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.height.equalTo(400)
            $0.width.equalTo(UIScreen.main.bounds.size.width / 2)
        }
        yellowView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(redView.snp.bottom)
            $0.height.equalTo(400)
            $0.width.equalTo(UIScreen.main.bounds.size.width / 2)
        }
        greenView.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.top.equalTo(orangeView.snp.bottom)
            $0.height.equalTo(400)
            $0.width.equalTo(UIScreen.main.bounds.size.width / 2)
        }
        blueView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(yellowView.snp.bottom)
            $0.height.equalTo(400)
            $0.width.equalTo(UIScreen.main.bounds.size.width / 2)
        }
        purpleView.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.top.equalTo(greenView.snp.bottom)
            $0.height.equalTo(400)
            $0.width.equalTo(UIScreen.main.bounds.size.width / 2)
        }
    }

}


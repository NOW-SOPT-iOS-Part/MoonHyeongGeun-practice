//import UIKit
//import Foundation
//
//final class ItemViewController: UIViewController {
//    
//    final let carrotLineSpacing: CGFloat = 10
//    final let carrotInterLineSpacing: CGFloat = 21
//    final let cellHeight: CGFloat = 198
//    final let carrotInset = UIEdgeInsets(top: 48, left: 20, bottom: 10, right: 20)
//    
//    private func calculateCellHeight() -> CGFloat {
//            let count = CGFloat(itemData.count)
//            let heightCount = count / 2 + count.truncatingRemainder(dividingBy: 2)
//        return heightCount * cellHeight + (heightCount - 1) * carrotLineSpacing + carrotInset.top + carrotInset.bottom
//        }
//    
//    private let collectionView : UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        return collectionView
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        self.view.backgroundColor = .white
//        
//        setLayout()
//        register()
//        setDelegate()
//    }
//    
//    private func setLayout() {
//        self.view.addSubview(collectionView)
//        
//        collectionView.snp.makeConstraints {
//            $0.top.horizontalEdges.equalToSuperview()
//            $0.height.equalTo(calculateCellHeight())
//        }
//    }
//}

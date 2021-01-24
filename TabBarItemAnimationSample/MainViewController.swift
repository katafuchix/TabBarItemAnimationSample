//
//  MainViewController.swift
//  TabBarItemAnimationSample
//
//  Created by cano on 2021/01/24.
//

import UIKit

class MainViewController: UITabBarController {
    
    var firstItemImageView: UIImageView = UIImageView()
    var secondItemImageView: UIImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Could not cast value of type 'UITabBarButtonLabel'  to 'UIImageView'
        // avoid
        if let imageView = self.tabBar.subviews[0].subviews.compactMap({ $0 as? UIImageView }).first {
            self.firstItemImageView = imageView
        }
        
        if let imageView = self.tabBar.subviews[1].subviews.compactMap({ $0 as? UIImageView }).first {
            self.secondItemImageView = imageView
        }
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // selected index
        guard let tappedIndex = self.tabBar.items?.firstIndex(of: item) else { return }
        
        switch tappedIndex {
        case 0:
            self.firstItemImageView.transform = CGAffineTransform.identity
            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseInOut, animations: { () -> Void in
                let rotation = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
                self.firstItemImageView.transform = rotation
            }, completion: { [unowned self] _ in
                self.firstItemImageView.transform = CGAffineTransform.identity
            })
        case 1:
            self.secondItemImageView.transform = CGAffineTransform.identity
            
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveLinear, animations: { () -> Void in
                let rotation = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
                self.secondItemImageView.transform = rotation
            }, completion: { [unowned self] _ in
                self.secondItemImageView.transform = CGAffineTransform.identity
            })
        default:
            break
        }
    }
}

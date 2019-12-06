//
//  BaseWireFrameProtocol.swift
//  iOS Clean Architecture
//
//  Created by Ahmed Nasser on 12/6/19.
//  Copyright © 2019 AvaVaas. All rights reserved.
//

import Foundation
import UIKit
protocol BaseWireframeProtocol : class {
}
@objc(BaseWireframe)
class BaseWireframe :NSObject {

    @objc public unowned var _viewController: UIViewController
    
    //to retain view controller reference upon first access
    private var _temporaryStoredViewController: UIViewController?

    @objc init(viewController: UIViewController) {
        _temporaryStoredViewController = viewController
        _viewController = viewController
    }
   
}
extension BaseWireframe {
    
    var viewController: UIViewController {
        defer { _temporaryStoredViewController = nil }
        return _viewController
    }
    
    var navigationController: UINavigationController? {
        return viewController.navigationController
    }
    
}

extension UIViewController {
    
    func presentWireframe(_ wireframe: BaseWireframe, animated: Bool = true, completion: (() -> Void)? = nil) {
        present(wireframe.viewController, animated: animated, completion: completion)
    }
    
}

extension UINavigationController {
    
    func pushWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        self.pushViewController(wireframe.viewController, animated: animated)
    }
    
    func setRootWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        self.setViewControllers([wireframe.viewController], animated: animated)
    }
    
}

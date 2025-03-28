//
//  ImageCoordinator.swift
//  Demo_Pixlr
//
//  Created by Dat Bui on 22/3/25.
//

import Foundation
import UIKit

final class ImageCoordinator {
    
    private var window: UIWindow?
    var rootNavigation = UINavigationController()
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let useCase = ImplImageUseCase.init(vibranceService: VibranceFilterService(),
                                            claheService: CLAHEFilterService())
        let viewModel = ImplImageViewModel(useCase: useCase)
        let viewController = ImageViewController(viewModel: viewModel)
        rootNavigation = UINavigationController(rootViewController: viewController)
        window?.rootViewController = rootNavigation
    }
}

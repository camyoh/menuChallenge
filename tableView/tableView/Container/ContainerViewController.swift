//
//  ContainerViewController.swift
//  tableView
//
//  Created by Carlos Mendieta on 4/15/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    enum SlideOutState {
        case bothCollapsed
        case leftPanelExpanded
    }
    
    private var isMenuHidden = true
    private var currentState: SlideOutState = .bothCollapsed
    private var menuViewController: MenuViewController!
    private var homeViewController: HomeViewController!
    private var homeNavigationController: UINavigationController!

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeViewController = UIStoryboard.homeViewController()
        homeViewController.delegate = self
        
        homeNavigationController = UINavigationController(rootViewController: homeViewController)
        homeNavigationController.isNavigationBarHidden = true
        view.addSubview(homeNavigationController.view)
        addChild(homeNavigationController)
        
        homeNavigationController.didMove(toParent:self)
    }

}

private extension UIStoryboard {
    static func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func menuViewController() -> MenuViewController? {
        return mainStoryboard().instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController
    }
    
    static func homeViewController() -> HomeViewController? {
        return mainStoryboard().instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
    }
}

// MARK: CenterViewController delegate

extension ContainerViewController: HomeViewControllerDelegate {
    
    func toggleMenuPanel() {
        let notAlreadyExpanded = (currentState != .leftPanelExpanded)
        if notAlreadyExpanded {
            addMenuViewController()
        }
        animateMenu(shouldExpand: notAlreadyExpanded)
    }
    
    func collapseSidePanels() {
        toggleMenuPanel()
    }
    
    func addMenuViewController() {
        
        guard menuViewController == nil else { return }
        
        if let vc = UIStoryboard.menuViewController() {
            addChildMenuController(vc)
            menuViewController = vc
        }
        menuViewController.delegate = homeViewController

    }

    func addChildMenuController(_ menuController: MenuViewController) {
        view.insertSubview(menuController.view, at: 0)
        addChild(menuController)
        menuController.didMove(toParent: self)

    }
    
    func animateMenu(shouldExpand: Bool) {
        let containerViewModel = ContainerViewModel()
        if shouldExpand{
            currentState = .leftPanelExpanded
            animateCenterPanelXPosition(targetPosition: homeNavigationController.view.frame.width * containerViewModel.expandedOffset)
            
        } else {
            animateCenterPanelXPosition(targetPosition: 0) { finished in
                self.currentState = .bothCollapsed
                self.menuViewController?.view.removeFromSuperview()
                self.menuViewController = nil
            }
        }
    }
    
    func animateCenterPanelXPosition(targetPosition: CGFloat, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: 0.35,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: .curveEaseInOut, animations: {
                        self.homeNavigationController.view.frame.origin.x = targetPosition
        }, completion: completion)
    }
}


//
//  ViewController.swift
//  tableView
//
//  Created by Carlos Mendieta on 4/15/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import UIKit

protocol HomeViewControllerDelegate {
    func toggleMenuPanel()
    func collapseSidePanels()
}

class HomeViewController: UIViewController {
    
    var delegate: HomeViewControllerDelegate!
    var homeViewModel = HomeViewModel()
    var option = 0
    @IBOutlet weak var eventsTableView: UITableView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func menuTapped(_ sender: UIBarButtonItem) {
        delegate.toggleMenuPanel()
    }
    
}

extension HomeViewController: MenuViewControllerDelegate {
    func didSelectOption(_ option: Int) {
        self.option = option
        eventsTableView.reloadData()
        delegate.collapseSidePanels()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let eventCell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventCell
        let event = homeViewModel.getEvent(index: indexPath.row)
        
        eventCell.setupCellFor(event: event, option: option, index: indexPath.row)
    
        return eventCell
    }
}

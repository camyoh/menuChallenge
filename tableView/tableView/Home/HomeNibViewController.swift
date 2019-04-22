//
//  HomeNibViewController.swift
//  tableView
//
//  Created by Carlos Mendieta on 4/22/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import UIKit

protocol HomeNibViewControllerDelegate {
    func toggleMenuPanel()
    func collapseSidePanels()
}

class HomeNibViewController: UIViewController {

    var delegate: HomeNibViewControllerDelegate!
    private var homeViewModel = HomeViewModel()
    private var option = 0
    @IBOutlet weak var eventsTableView: UITableView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func menuTapped(_ sender: UIBarButtonItem) {
        delegate.toggleMenuPanel()
    }
    
}

extension HomeNibViewController: MenuNibViewControllerDelegate {
    func didSelectOption(_ option: Int) {
        self.option = option
        eventsTableView.reloadData()
        delegate.collapseSidePanels()
    }
}

extension HomeNibViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let eventCell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventCell
        let event = homeViewModel.getEvent(index: indexPath.row)
        
        eventCell.setupCellFor(event: event, option: option, randomNumber: homeViewModel.arrayWithRandomNumbers[indexPath.row])
        
        return eventCell
    }
}

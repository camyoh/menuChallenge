//
//  MenuNibViewController.swift
//  tableView
//
//  Created by Carlos Mendieta on 4/22/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import UIKit

protocol MenuNibViewControllerDelegate {
    func didSelectOption(_ option: Int)
}

class MenuNibViewController: UIViewController {

    let menuViewModel = MenuViewModel()
    var delegate: MenuNibViewControllerDelegate!
    var options: [String]!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
}

// MARK: Table View Data Source
extension MenuNibViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuViewModel.options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OptionCell", for: indexPath) as! OptionCell
        cell.optionLabel.text = menuViewModel.options[indexPath.row]
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = #colorLiteral(red: 0.154821068, green: 0.1740432382, blue: 0.1897847056, alpha: 1)
        cell.selectedBackgroundView = backgroundView
        
        return cell
    }
}
// MARK: Table View Delegate`
extension MenuNibViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didSelectOption(indexPath.row)
    }
}

//
//  ImageDescriptionCell.swift
//  tableView
//
//  Created by Yoh on 4/16/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var imageWidth: NSLayoutConstraint!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    @IBOutlet weak var leadingTitle: NSLayoutConstraint!
    
    
    var arrayWithRandomNumbers = [Int]()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        showImage()
        eventTitle.text = nil
        eventDescription.text = nil
    }
    
    func setupCellFor(event: Event, option: Int, index: Int){
        createRandomNumbers()
        eventTitle.text = event.name
        eventDescription.text = event.description
        eventImage.image = UIImage(named: event.image)
        
        switch option
        {
        case 0:
            showImage()
        case 1:
            hideImage()
        case 2:
            if arrayWithRandomNumbers[index].isMultiple(of: 2){
                hideImage()
            }else{
                showImage()
            }
        default:
            hideImage()
        }
    }
    
    func hideImage(){
        imageWidth.constant = 0
        imageHeight.constant = 0
        leadingTitle.constant = 16
    }
    
    func showImage(){
        imageWidth.constant = 100
        imageHeight.constant = 100
        leadingTitle.constant = 16
    }
    
    func createRandomNumbers(){
        let homeViewModel = HomeViewModel()
        for _ in 0..<homeViewModel.events.count {
            arrayWithRandomNumbers.append(Int.random(in: 0...1))
        }
    }
    
}

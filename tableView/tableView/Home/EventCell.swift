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
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        eventTitle.text = nil
        eventDescription.text = nil
    }
    
    func setupCellFor(event: Event, option: Int, randomNumber: Int){
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
            if randomNumber.isMultiple(of: 2){
                hideImage()
            }else{
                showImage()
            }
        default:
            hideImage()
        }
    }
    
    private func hideImage(){
        imageWidth.constant = 0
        imageHeight.constant = 0
        leadingTitle.constant = 16
    }
    
    private func showImage(){
        imageWidth.constant = 100
        imageHeight.constant = 100
        leadingTitle.constant = 16
    }
    
}

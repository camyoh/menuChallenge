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
    @IBOutlet weak var leadingImage: NSLayoutConstraint!
    
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageWidth.constant = 130
        leadingImage.constant = 12
    }
    
    func setupCellFor(event: Event, option: Int){
        
        eventTitle.text = event.name
        eventDescription.text = event.description
        eventImage.image = UIImage(named: event.image)
        
        switch option
        {
        case 0:
            imageWidth.constant = 130
            leadingImage.constant = 12
        case 1:
            imageWidth.constant = 0
            leadingImage.constant = 0
        case 2:
            let random = Int.random(in: 0...1)
            if random.isMultiple(of: 2){
                imageWidth.constant = 0
                leadingImage.constant = 0
            }else{
                imageWidth.constant = 130
                leadingImage.constant = 12
            }
        default:
            imageWidth.constant = 0
            leadingImage.constant = 0
        }
    }
}

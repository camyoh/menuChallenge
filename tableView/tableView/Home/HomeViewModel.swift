//
//  HomeViewModel.swift
//  tableView
//
//  Created by Carlos Mendieta on 4/15/19.
//  Copyright © 2019 Carlos Mendieta. All rights reserved.
//

import Foundation

struct HomeViewModel {

    let events = RequestModel.getEventsData()
    private var randomArray = [Int]()

    init() {
        loadRandomArray(eventsSize: events.count)
    }
    
    func getTitle(index: Int) -> String {
        return events[index].name
    }
    
    func getDescription(index: Int) -> String {
        return events[index].description ?? ""
    }
    
    func getImage(index: Int) -> String {
        return events[index].image
    }
    
    private mutating func loadRandomArray(eventsSize: Int){
        for _ in 0 ..< eventsSize {
            let randomNumber = Int.random(in: 0...1)
            randomArray.append(randomNumber)
        }
    }
    
    func getRandomNumber(index: Int) -> Int{
        return randomArray[index]
    }
}

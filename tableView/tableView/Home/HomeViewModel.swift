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
    private(set) var arrayWithRandomNumbers = [Int]()
    
    init() {
        createArrayWithRandomNumbers()
    }
    
    func getEvent(index: Int) -> Event{
        return events[index]
    }
    
    private mutating func createArrayWithRandomNumbers(){
        for _ in 0..<events.count {
            arrayWithRandomNumbers.append(Int.random(in: 0...1))
        }
    }
}

//
//  JobDetailsViewModel.swift
//  KLM Assignment
//
//  Created by Евгений Урбановский on 5/3/23.
//

import Foundation

struct JobDetailsViewModel {
    let element: JobDTO
    
    var jobDetailsTitleString: String {
        "\(element.title) at \(element.companyName)"
    }
    
    var jobDescriptionAttributedString: NSAttributedString? {
        element.description.htmlAttributed()
    }
    
    var jobDateOfCreationsString: String {
        let timeInterval = TimeInterval(element.createdAt)
        let date = Date(timeIntervalSince1970: timeInterval)
        return DateFormatter.mediumTimeDateStyle.string(from: date)
    }
}

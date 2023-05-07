//
//  JobDTO.swift
//  KLM Assignment
//
//  Created by Евгений Урбановский on 5/2/23.
//

import UIKit.UIFont

struct JobDTO: Hashable {
    let id: UUID
    let companyName: String
    let title: String
    let description: String
    let remote: Bool
    let url: String
    let location: String
    let createdAt: Int
    
    var jobDetailsTitleString: String {
        "\(title) at \(companyName)"
    }
    
    var jobDescriptionAttributedString: NSAttributedString? {
        description.htmlAttributed()
    }
    
    var jobDateOfCreationsString: String {
        createdAt.toDateFormattedString()
    }
}

extension JobDTO {
    init(with response: JobResponse) {
        id = UUID()
        companyName = response.companyName
        title = response.title
        description = response.description
        remote = response.remote
        url = response.url
        location = response.location
        createdAt = response.createdAt
    }
}

extension JobDTO {
    init(with object: JobObject) {
        id = object.id
        companyName = object.companyName
        title = object.title
        description = object.jobDescription
        remote = object.remote
        url = object.url
        location = object.location
        createdAt = object.createdAt
    }
}

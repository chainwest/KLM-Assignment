//
//  JobsRepository.swift
//  KLM Assignment
//
//  Created by Евгений Урбановский on 5/2/23.
//

import RealmSwift

final class JobsRepository {
    private let storage = StorageService()
    
    func fetchJobs() -> [JobDTO] {
        storage.fetch(by: JobObject.self)
            .toArray()
            .map(JobDTO.init)
    }
    
    func deleteJobs() {
        try? storage.deleteAll()
    }
    
    func saveJobs(dto: [JobDTO]) {
        let cache = dto.map(JobObject.init)
        try? storage.saveOrUpdateAllObjects(objects: cache)
    }
}

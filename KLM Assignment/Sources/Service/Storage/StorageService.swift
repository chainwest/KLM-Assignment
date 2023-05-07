//
//  StorageService.swift
//  KLM Assignment
//
//  Created by Евгений Урбановский on 5/2/23.
//

import Foundation
import RealmSwift

final class StorageService {
    private let storage: Realm?

    init(_ configuration: Realm.Configuration = Realm.Configuration(inMemoryIdentifier: "inMemory")) {
        self.storage = try? Realm(configuration: configuration)
    }

    func saveOrUpdateObject(object: Object) {
        performWriteOperation { storage in
            storage.add(object, update: .all)
        }
    }

    func saveOrUpdateAllObjects(objects: [Object]) {
        objects.forEach { saveOrUpdateObject(object: $0) }
    }

    func delete(object: Object) {
        performWriteOperation { storage in
            storage.delete(object)
        }
    }

    func deleteAll() {
        performWriteOperation { storage in
            storage.deleteAll()
        }
    }

    func fetch<T: Object>(by type: T.Type) -> Results<T> {
        guard let storage = storage else {
            let config = Realm.Configuration(inMemoryIdentifier: "temp")
            let realm = try! Realm(configuration: config)
            return realm.objects(T.self)
        }
        return storage.objects(T.self)
    }

    private func performWriteOperation(_ operation: @escaping (Realm) -> Void) {
        guard let storage = storage else { return }
        try? storage.write {
            operation(storage)
        }
    }
}

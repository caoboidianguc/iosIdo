//
//  PersonStore.swift
//  IDo
//
//  Created by Jubi on 8/27/23.
//

import Foundation

@MainActor
class PersonStore: ObservableObject {
    @Published var person: Person = Person(name: "", vandong: Person.mucTap, avatar: .bong)
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("Person.data")
    }
    
    func load() async throws {
        let task = Task<Person, Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return Person(name: "", vandong: Person.mucTap, avatar: .bong)
            }
            let person = try JSONDecoder().decode(Person.self, from: data)
            return person
        }
        let user = try await task.value
        self.person = user
    }
    
    func save(person: Person) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(person)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}

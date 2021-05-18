//
//  Repository.swift
//  AndrzejSampleApp
//
//  Created by Julien Sechaud on 11/05/2021.
//

import Foundation


class Repository {
	func fetch(handler: (Result<[User]?, Error>) -> Void) {
		let decoder = JSONDecoder()

		// When
		var result: [User]?
		do {
			result = try decoder.decode([User].self, from: Repository.jsonData)
		} catch let error {
			handler(.failure(error))
		}
		handler(.success(result))
	}
}

extension Repository {
	static let jsonData = """
	[
		{
			"id": "e36626e8-8c38-4aed-80ef-12fa08725da0",
			"gender": "female",
			"age": 29,
			"firstName": "Alisa"
		},
		{
			"id": "e36626e8-8c38-4aed-80ef-12fa08725da0",
			"gender": "male",
			"age": 26,
			"firstName": "Radek"
		},
		{
			"id": "e36626e8-8c38-4aed-80ef-12fa08725da0",
			"gender": "male",
			"age": 24,
			"firstName": "Alexis"
		},
		{
			"id": "e36626e8-8c38-4aed-80ef-12fa08725da0",
			"gender": "male",
			"age": 35,
			"firstName": "Julien"
		}
	]
	""".data(using: .utf8)!
}

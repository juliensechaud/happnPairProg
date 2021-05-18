//
//  User.swift
//  AndrzejSampleApp
//
//  Created by Julien Sechaud on 11/05/2021.
//

import Foundation

struct User: Decodable {
	let id: String
	let firstName: String?
	let age: Int?
}

//
//  Follower.swift
//  GHFollowers
//
//  Created by Anahi Rojas on 24/08/21.
//

import Foundation

struct Follower: Codable, Hashable {
    //When you use codable, the vars that you declare must match the ones on the JSON Response
    //Can be in camelCase or in snake_case
    
    var login: String
    var avatarUrl: String
}

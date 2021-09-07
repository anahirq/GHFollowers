//
//  GFError.swift
//  GHFollowers
//
//  Created by Anahi Rojas on 01/09/21.
//

import Foundation

//It has a raw value of string anf Conforms to the error protocol
enum GFError: String, Error {
    
    case invalidUsername  = "This username created an invalid request. Please type again"
    case unableToComplete = "Unable to complete your request. Pleasse check your internet connection."
    case invalidResponse  = "Invalid response from the server. Please try again."
    case invalidData      = "The data recived from the server was invalid. Please try again."
    
}

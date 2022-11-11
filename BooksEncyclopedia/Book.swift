//
//  Book.swift
//  BooksEncyclopedia
//
//  Created by SOCS2 on 08/11/21.
//

import Foundation

class Book: CustomStringConvertible {
    var title: String? = nil
    var author: String? = nil
    var price: Double? = nil
    var thumbnail: String? = nil
    
    var description: String {
        get {
           return "Title: \(title!), Author: \(author!), Price:\(price!)"
        }
    }
}

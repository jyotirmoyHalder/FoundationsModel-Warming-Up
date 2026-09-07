//
//  Person.swift
//  FoundationsModel Warming Up
//
//  Created by jyotirmoy_halder on 6/9/26.
//

import Foundation
import FoundationModels

@Generable
struct Person {
    @Guide(description: "Extract first name from description. If you cannot extract then use an empty string.")
    let firstName: String
    
    @Guide(description: "Extract last name from description. If you cannot extract then use an empty string.")
    let lastName: String
    
    @Guide(description: "Extract phone from description. If you cannot extract then use an empty string.")
    let phone: String
    
    @Guide(description: "Extract email address from description. If you cannot extract then use an empty string.")
    let email: String
    
    @Guide(description: "Extract children as 'Child' struct from description. If you cannot extract then use an empty string.")
    let children: [Child]
    
    @Guide(description: "Extract company from description. If you cannot extract then use an empty string.")
    let company: String
    
    @Guide(description: "Extract title from description. If you cannot extract then use an empty string.")
    let title: String
    
    init() {
        self.firstName = ""
        self.lastName = ""
        self.phone = ""
        self.email = ""
        self.children = []
        self.company = ""
        self.title = ""
    }
    
    init(firstName: String, lastName: String, phone: String, email: String, children: [Child], company: String, title: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.phone = phone
        self.email = email
        self.children = children
        self.company = company
        self.title = title
    }
}

@Generable
struct Child: Identifiable {
    let id = UUID()
    
    @Guide(description: "Extract name of the child from description. If you cannot extract then use an empty string.")
    let name: String
    
    @Guide(description: "Extract age of the child from description. If you cannot extract then use an empty string.")
    let age: Int
}

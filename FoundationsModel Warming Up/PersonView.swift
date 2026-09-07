//
//  PersonView.swift
//  FoundationsModel Warming Up
//
//  Created by jyotirmoy_halder on 7/9/26.
//

import SwiftUI

struct PersonView: View {
    let person: Person
    
    var body: some View {
        // MARK: - Personal Info
        Section {
            if !person.firstName.isEmpty {
                Text("First Name: \(person.firstName)")
            }
            
            if !person.lastName.isEmpty {
                Text("Last Name: \(person.lastName)")
            }
            
            if !person.phone.isEmpty {
                Label(person.phone, systemImage: "phone.fill")
            }
            
            if !person.email.isEmpty {
                Label(person.email, systemImage: "envelope.fill")
            }
        } header: {
            Label("Contact Info", systemImage: "person.fill")
        }
        
        // MARK: - Work Info
        if !person.company.isEmpty || !person.title.isEmpty {
            Section {
                if !person.title.isEmpty {
                    Text("Title: \(person.title)")
                }
                if !person.company.isEmpty {
                    Text("Company: \(person.company)")
                }
            } header: {
                Label("Work Info", systemImage: "briefcase.fill")
            }
        }
        
        // MARK: - Children Info
        if !person.children.isEmpty {
            Section {
                ForEach(person.children) { child in
                    if !child.name.isEmpty {
                        Text("Name: \(child.name)")
                    }
                    if child.age != 0 {
                        Text("Age: \(child.age)")
                    }
                }
            } header: {
                Label("Children", systemImage: "person.2.fill")
            }
        }
    }
}

#Preview {
    Form {
        PersonView(
            person: .init(
                firstName: "Tiffany",
                lastName: "Jones",
                phone: "12234435",
                email: "some@gmail.com",
                children: [.init(name: "someone", age: 23), .init(name: "someone else", age: 24)],
                company: "Amazing Company",
                title: "CEO"
            )
        )
    }
}

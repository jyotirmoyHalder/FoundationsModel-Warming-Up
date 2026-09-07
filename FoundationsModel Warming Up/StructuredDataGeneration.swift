//
//  StructuredDataGeneration.swift
//  FoundationsModel Warming Up
//
//  Created by jyotirmoy_halder on 7/9/26.
//

import SwiftUI
import FoundationModels

struct StructuredDataGeneration: View {
    let prompt = """
        Extract names, phone number, email, etc from the following description:
        I just met this wonderful woman named Tiffany Jones who has two children named James and Happy who are 10 and 8, respectively. Her phone is 1234567890 and email is tiffany@example.com.
        She is the CEO of a company called SoVeryCool.
        """
    
    @State private var isLoading = false
    @State private var errormessage: String?
    @State private var person = Person()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text(prompt)
                    
                    Button {
                        Task {
                            await generatePersonFromDescription()
                        }
                    } label: {
                        if isLoading {
                            ProgressView()
                        } else {
                            Text("Generate Person")
                                .bold()
                        }
                    }

                } header: {
                    Text("Prompt")
                }
                
                if let error = errormessage {
                    Section {
                        HStack(alignment: .top, spacing: 10) {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .foregroundStyle(.red)
                            
                            VStack(alignment: .leading) {
                                Text("Failed to generate response.")
                                
                                Text(error)
                            }
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        }
                    }
                }
                
                Section {
                    PersonView(person: person)
                } header: {
                    Text("Person Description")
                }

            }
            .navigationTitle("Personal Details")
        }
    }
    
    private func generatePersonFromDescription() async {
        isLoading = true
        errormessage = nil
        
        person = Person()
        
        do {
            let session = LanguageModelSession()
            let response = try await session
                .respond(to: prompt, generating: Person.self)
            
            person = response.content
        } catch {
            errormessage = error.localizedDescription
        }
        
        isLoading = false
    }
}

#Preview {
    StructuredDataGeneration()
}

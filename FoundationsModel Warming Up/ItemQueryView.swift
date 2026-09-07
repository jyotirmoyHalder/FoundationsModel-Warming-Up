//
//  ItemQueryView.swift
//  FoundationsModel Warming Up
//
//  Created by jyotirmoy_halder on 25/8/26.
//

import SwiftUI
import Playgrounds
import FoundationModels

struct ItemQueryView: View {
    // Inputs
    @State private var itemName = ""
    @State private var quantity: Double = 3
    
    var invalidItemName: Bool {
        itemName.count < 3
    }
    
    // Error and loading
    @State private var errorMessage: String?
    @State private var isLoading = false
    
    // Response
     @State private var responseString: String = ""
        
    // Promt
    var prompt: String {
        if invalidItemName {
            return ""
        } else {
            return quantity == 1 ? "Please name \(quantity.formatted()) type of \(itemName)" : "Please name \(quantity.formatted()) types of \(itemName)"
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                // Input Section
                VStack(spacing: 16) {
                    TextField("Item name", text: $itemName)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                    
                    VStack(spacing: 8) {
                        Text("Quantity: \(quantity.formatted())")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        
                        Slider(
                            value: $quantity,
                            in: 1...10,
                            step: 1
                        ).padding(.horizontal)
                    }
                }
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 16))
                .shadow(radius: 4)
                
                // Prompt
                Text(prompt)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // Action Button
                Button {
                    // TODO: Action...
                    Task {
                        await generateItems()
                    }
                } label: {
                    if isLoading {
                        ProgressView()
                    } else {
                        Label("Generate", systemImage:"wand.and.stars")
                            .bold()
                    }
                }
                .buttonStyle(.glassProminent)
                .controlSize(.large)
                .padding()
                .disabled(invalidItemName)
                
                // Response Display
                if !responseString.isEmpty {
                    // show response
                    GroupBox {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Model Response")
                                .font(.headline)
                                .foregroundStyle(.primary)
                            
                            if let _ = errorMessage {
                                Text("Unable to Generate Items. ")
                                    .foregroundStyle(.red)
                                    .padding()
                            } else {
                                ScrollView {
                                    Text(LocalizedStringKey(responseString))
                                        .padding(.top, 4)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                        }
                    }
                }

            }
            .padding()
            .navigationTitle("Item Generator")
        }
    }
    
    private func generateItems() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let session = LanguageModelSession()
            let response = try await session
                .respond(to: prompt)
            responseString = response.content
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}

#Preview {
    ItemQueryView()
}

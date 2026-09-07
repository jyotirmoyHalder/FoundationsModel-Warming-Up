//
//  Playground Foundation.swift
//  FoundationsModel Warming Up
//
//  Created by jyotirmoy_halder on 26/8/26.
//

import Foundation
import Playgrounds
import FoundationModels

#Playground {
    let prompt = """
        Extract names, phone number, email, etc from the following description:
        I just met this wonderful woman named Tiffany Jones who has two children named Bob and Jane who are 10 and 8, respectively. Her phone is 1234567890 and email is tiffany@example.com.
        She is the CEO of a company called SoVeryCool.
        """
    
    do {
        let session = LanguageModelSession()
        
        let response = try await session.respond(to: prompt, generating: Person.self)
        
        print(response.content)
        print(response.content.firstName)
    } catch {
        let errorMessage = error.localizedDescription
        print(errorMessage)
    }
}

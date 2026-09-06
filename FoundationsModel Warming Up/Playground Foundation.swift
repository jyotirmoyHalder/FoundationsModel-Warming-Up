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
    let session = LanguageModelSession()
    let prompt = "Please name three types of exotic fruits."

    Task {
        let response = try await session.respond(to: prompt)
        print(response.content)
    }
}

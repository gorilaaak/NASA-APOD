//
//  NASA_API.swift
//  NASA APOD
//
//  Created by Jakub Petrik on 06/03/2023.
//

struct NASAmain: Codable {
    let result: [Result]
    
    
    struct Result: Codable {
        let copyright: String?
        let date: Int
        let explanation: String
        let hdurl: String
        let media_type: String
        let service_version: String
        let title: String?
        let url: String
    }
}







//
//  NASA_API.swift
//  NASA APOD
//
//  Created by Jakub Petrik on 06/03/2023.
//

import SwiftUI

struct nasaObject: Codable {
    let title: String
    let explanation: String
    let url: String
    let copyright: String?
    let date: String
    let hdurl: String
}




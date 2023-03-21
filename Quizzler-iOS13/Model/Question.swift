//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Anisa Fatimah Azzahra on 21/03/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation
struct Question{
    let text: String
    let  answer: String
    
    init(q: String, a: String) {
        self.text = q
        self.answer = a
    }
}

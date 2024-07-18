//
//  DifficultyLevelRowView.swift
//  Hiking Planner
//
//  Created by MacBook Air on 17.07.24.
//

import SwiftUI

struct DifficultyLevelRowView: View {
    var level: DifficultyLevel

    var body: some View {
        Text(level.rawValue.capitalized)
            .font(.headline)
            .padding()
    }
}


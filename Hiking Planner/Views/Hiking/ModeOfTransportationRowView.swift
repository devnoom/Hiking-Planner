//
//  ModeOfTransportationRowView.swift
//  Hiking Planner
//
//  Created by MacBook Air on 17.07.24.
//

import SwiftUI

struct ModeOfTransportationRowView: View {
    let mode: ModeOfTransportation

    var body: some View {
        HStack {
            Text(mode.rawValue)
                .font(.headline)
            Spacer()
        }
        .padding()
    }
}

struct ModeOfTransportationRowView_Previews: PreviewProvider {
    static var previews: some View {
        ModeOfTransportationRowView(mode: .walking)
            .previewLayout(.sizeThatFits)
    }
}




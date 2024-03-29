//
//  TargetingSpecificsView.swift
//  MarketingApp
//
//  Created by Alexandra on 29.03.2024.
//

import SwiftUI

struct TargetingSpecificsView: View {
    @State var listOfSelections = Set<String>()
    var options: [String] = ["option1", "option2"]
    
    var body: some View {
        VStack {
            Text("Selected: \(listOfSelections.description)")
                .padding()

            List(options, id: \.self, selection: $listOfSelections) {
                        Text("\($0)")
                    }
                    .environment(\.editMode, .constant(EditMode.active))
            
            Button {
                print("Button Pressed")
            } label: {
                Text("Next Step")
            }
        }
    }
}

#Preview {
    TargetingSpecificsView(listOfSelections: Set<String>())
}

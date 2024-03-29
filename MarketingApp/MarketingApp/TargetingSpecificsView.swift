//
//  TargetingSpecificsView.swift
//  MarketingApp
//
//  Created by Alexandra on 29.03.2024.
//

import SwiftUI

struct TargetingSpecificsView: View {
    @StateObject var viewModel = TargetingSpecificsViewModel(channels: MockDataModel.mockData)
    
    var body: some View {
        VStack {
            Text("Selected: \(viewModel.listOfSelections.description)")
                .padding()

            List(viewModel.targetingSpecifics, id: \.self, selection: $viewModel.listOfSelections) {
                        Text("\($0)")
                    }
                    .environment(\.editMode, .constant(EditMode.active))
            
            Button {
                print("Button Pressed")
            } label: {
                Text("Next Step")
            }
            .disabled(!viewModel.isButtonActive)
        }
    }
}

#Preview {
    TargetingSpecificsView()
}

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
        NavigationStack{
            VStack {                
                List(viewModel.targetingSpecifics, id: \.self, selection: $viewModel.listOfSelections) {
                    Text("\($0)")
                }
                .environment(\.editMode, .constant(EditMode.active))
                
                Button {
                    print("Button Pressed")
                } label: {
                    NavigationLink(destination: ChannelsView(viewModel: ChannelsViewModel(channels: viewModel.findChannelsForSelection()))) {
                        Text(viewModel.buttonText)
                    }
                }
                .disabled(!viewModel.isButtonActive)
            }
            .navigationTitle("Targeting Specifics")
        }
        
    }
}

#Preview {
    TargetingSpecificsView()
}

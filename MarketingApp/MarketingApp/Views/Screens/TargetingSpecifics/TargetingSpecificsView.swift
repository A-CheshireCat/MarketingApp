//
//  TargetingSpecificsView.swift
//  MarketingApp
//
//  Created by Alexandra on 29.03.2024.
//

import SwiftUI

struct TargetingSpecificsView: View {
    @StateObject var viewModel = TargetingSpecificsViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List(viewModel.targetingSpecifics, id: \.self, selection: $viewModel.listOfSelections) {
                    Text("\($0)")
                }
                .listStyle(.insetGrouped)
                .environment(\.editMode, .constant(EditMode.active))
                
                NavigationLink(destination: ChannelsView(viewModel: ChannelsViewModel(channels: viewModel.getChannelsForSelection()))) {
                    Text(viewModel.buttonText)
                }
                .disabled(!viewModel.isButtonActive)
            }
            
            .navigationTitle("Targeting Specifics")
        }
        .onAppear {
            viewModel.downloadChannels()
        }
    }
}

#Preview {
    TargetingSpecificsView()
}

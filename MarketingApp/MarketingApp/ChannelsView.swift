//
//  ChannelsView.swift
//  MarketingApp
//
//  Created by Alexandra on 01.04.2024.
//

import SwiftUI

struct ChannelsView: View {
    @StateObject var viewModel: ChannelsViewModel
    
    var body: some View {
        List(viewModel.channelsFromSelection, id: \.self) { channel in
            Button{
                viewModel.presentedChannelIndex = viewModel.channelsFromSelection.firstIndex(where: {$0.id == channel.id}) ?? 0
            } label:{
                VStack(alignment: .leading) {
                    Text(channel.name)
                    Text(channel.selectedCampaignIndex < channel.campaigns.count ? "Campaign Selected" : "")
                        .foregroundStyle(.red)
                }
            }
        }
        .sheet(isPresented: $viewModel.detailsShowing) {
            ChannelDetailsView(detailsShowing: $viewModel.detailsShowing,
                               channel: $viewModel.channelsFromSelection[viewModel.presentedChannelIndex])
        }
        
        NavigationLink(destination: ReviewEmailView(viewModel: ReviewEmailViewModel(selectedChannels: viewModel.getChannelsWithSelections()))) {
            Text(viewModel.buttonText)
        }
        .disabled(!viewModel.isButtonActive)
        
        .navigationTitle("Channels")
    }
}

#Preview {
    ChannelsView(viewModel: ChannelsViewModel(channels: MockDataModel.mockData))
}

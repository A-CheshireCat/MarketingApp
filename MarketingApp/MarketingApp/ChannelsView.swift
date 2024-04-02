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
                viewModel.presentedChannel = channel
            } label:{
                VStack {
                    Text(channel.name)
                    Text(channel.isCampaignSelected ? "Campaign Selected" : "")
                        .foregroundStyle(.red)
                }
            }
        }
        .sheet(isPresented: $viewModel.detailsShowing) {
            ChannelDetailsView(viewModel: ChannelDetailsViewModel(channel: viewModel.presentedChannel!))
        }
        
        Button {
            print("Button Pressed")
        } label: {
            Text(viewModel.buttonText)
        }
        .disabled(false)
    }
}

#Preview {
    ChannelsView(viewModel: ChannelsViewModel(channels: MockDataModel.mockData))
}

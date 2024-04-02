//
//  ChannelDetailsView.swift
//  MarketingApp
//
//  Created by Alexandra on 01.04.2024.
//

import SwiftUI

struct ChannelDetailsView: View {
    @Environment(\.dismiss) private var dismiss

    @StateObject var viewModel: ChannelDetailsViewModel
            
    var body: some View {
        HStack{
            Spacer()
            Button {
                dismiss()
            } label: {
                Text("Close")
                    .padding()
            }
        }
        
        Text(viewModel.channel.name)
            .font(.title)
        
        Picker("Campaign selected", selection: $viewModel.selectionIndex) {
            ForEach(viewModel.channel.campaigns.indices, id: \.self) { index in
                Text("\(viewModel.channel.campaigns[index].monthlyFee) euro / month")
            }
            Text("None").tag(viewModel.channel.campaigns.count)
        }
            
        List {
            ForEach(viewModel.channel.campaigns, id: \.self) { campaign in
                CampaignCardView(campaign: campaign)
                    .background(campaign.isSelected ? .green : .gray)
            }
        }
        .listStyle(.insetGrouped)

    }
}

#Preview {
    ChannelDetailsView(viewModel: ChannelDetailsViewModel(channel: MockDataModel.mockData[1]))
}

struct CampaignCardView: View {
    var campaign: CampaignModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(campaign.monthlyFee) euro / month")
                .fontWeight(.bold)
                .padding(8)
            ForEach(campaign.details, id: \.self) { detail in
                LazyVStack(alignment: .leading) {
                    Text(detail)
                }
                .padding(8)
            }
        }
        .padding()
    }
}

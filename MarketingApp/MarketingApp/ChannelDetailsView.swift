//
//  ChannelDetailsView.swift
//  MarketingApp
//
//  Created by Alexandra on 01.04.2024.
//

import SwiftUI

struct ChannelDetailsView: View {
    @Binding var detailsShowing: Bool
    @Binding var channel: ChannelModel
            
    var body: some View {
        HStack{
            Spacer()
            Button {
                detailsShowing = false
            } label: {
                Text("Close")
                    .padding()
            }
        }
        
        Text(channel.name)
            .font(.title)
        
        Picker("Campaign selected", selection: $channel.selectedCampaignIndex) {
            Text("None").tag(channel.campaigns.count)

            ForEach(channel.campaigns.indices, id: \.self) { index in
                Text("\(channel.campaigns[index].monthlyFee) euro / month")
            }
        }
        .onChange(of: channel.selectedCampaignIndex) { _ in
            for index in 0..<channel.campaigns.count {
                channel.campaigns[index].isSelected = channel.selectedCampaignIndex == index ? true : false
            }
        }
            
        List {
            ForEach(channel.campaigns, id: \.self) { campaign in
                CampaignCardView(campaign: campaign)
                    .background(campaign.isSelected ? .green : .gray)
            }
        }
        .listStyle(.insetGrouped)

    }
}

#Preview {
    ChannelDetailsView(detailsShowing: .constant(true),
                       channel: .constant(MockDataModel.mockData[0]))
}

//
//  ReviewEmailView.swift
//  MarketingApp
//
//  Created by Alexandra on 04.04.2024.
//

import SwiftUI

struct ReviewEmailView: View {
    @StateObject var viewModel: ReviewEmailViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.selectedChannels, id: \.self){ channel in
                Section(channel.name, content: {
                    CampaignCardView(campaign: channel.campaigns[0])
                        .background(.green)
                })
            }
        }
        .listStyle(.insetGrouped)
        
        Button {
            print("sent email")
        } label: {
            Text("Send Email")
        }
        
        .navigationTitle("Review")
    }
}

#Preview {
    ReviewEmailView(viewModel: ReviewEmailViewModel(selectedChannels: MockDataModel.mockData))
}

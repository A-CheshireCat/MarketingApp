//
//  CampaignCardView.swift
//  MarketingApp
//
//  Created by Alexandra on 04.04.2024.
//

import SwiftUI

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

#Preview {
    CampaignCardView(campaign: MockDataModel.mockData[0].campaigns[0])
}

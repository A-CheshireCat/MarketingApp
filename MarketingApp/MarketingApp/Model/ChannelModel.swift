//
//  ChannelModel.swift
//  MarketingApp
//
//  Created by Alexandra on 29.03.2024.
//

import Foundation

struct ChannelModel: Identifiable {
    var id = UUID()
    
    let name: String
    let targetingSpecifics: [String]
    let campaigns: [CampaignModel]
    
    var isCampaignSelected: Bool = false
}

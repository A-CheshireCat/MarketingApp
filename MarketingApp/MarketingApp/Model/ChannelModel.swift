//
//  ChannelModel.swift
//  MarketingApp
//
//  Created by Alexandra on 29.03.2024.
//

import Foundation

struct ChannelModel: Identifiable, Hashable {
    var id = UUID()
    
    let name: String
    let targetingSpecifics: [String]
    var campaigns: [CampaignModel]
    
    var selectedCampaignIndex: Int = Int.max
    
    init(name: String, targetingSpecifics: [String], campaigns: [CampaignModel]){
        self.name = name
        self.targetingSpecifics = targetingSpecifics
        self.campaigns = campaigns
    }
    
    init(responseChannel: ResponseChannel) {
        self.name = responseChannel.name
        self.targetingSpecifics = responseChannel.targetingSpecifics
        
        var campaigns = [CampaignModel]()
        responseChannel.campaigns.forEach { responseCampaign in
            campaigns.append(CampaignModel(responseCampaign: responseCampaign))
        }
        self.campaigns = campaigns
    }
}

struct ResponseChannel: Decodable {
    let name: String
    let targetingSpecifics: [String]
    let campaigns: [ResponseCampaign]
}

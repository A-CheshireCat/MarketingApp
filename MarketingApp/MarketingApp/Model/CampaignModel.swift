//
//  CampaignModel.swift
//  MarketingApp
//
//  Created by Alexandra on 29.03.2024.
//

import Foundation

struct CampaignModel: Hashable {
    let monthlyFee: Int
    let details: [String]
    
    var isSelected: Bool = false
    
    init(monthlyFee: Int, details: [String]) {
        self.monthlyFee = monthlyFee
        self.details = details
    }
    
    init(responseCampaign: ResponseCampaign) {
        monthlyFee = responseCampaign.monthlyFee
        details = responseCampaign.details
    }
}

struct ResponseCampaign: Decodable {
    let monthlyFee: Int
    let details: [String]
}

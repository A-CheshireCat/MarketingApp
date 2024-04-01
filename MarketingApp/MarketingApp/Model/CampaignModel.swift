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
}

//
//  ChannelsViewModel.swift
//  MarketingApp
//
//  Created by Alexandra on 01.04.2024.
//

import Foundation

class ChannelsViewModel: ObservableObject {
    var channelsFromSelection: [ChannelModel] {
        didSet {
            buttonText = hasSelectedCampaigns() ? "Review selections" : "No campaigns selected"
            isButtonActive = hasSelectedCampaigns() ? true : false
        }
    }

    @Published var isButtonActive = false
    @Published var buttonText = "No campaigns"
        
    init(channels: [ChannelModel]) {
        channelsFromSelection = channels
    }
    
    func hasSelectedCampaigns() -> Bool {
        var hasSelectedCampaigns = false
        
        channelsFromSelection.forEach {
            if $0.isCampaignSelected {
                hasSelectedCampaigns = true
                return
            }
        }
        
        return hasSelectedCampaigns
    }
}

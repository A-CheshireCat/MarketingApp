//
//  ReviewEmailViewModel.swift
//  MarketingApp
//
//  Created by Alexandra on 04.04.2024.
//

import Foundation

class ReviewEmailViewModel: ObservableObject {
    var selectedChannels: [ChannelModel]

    init(selectedChannels: [ChannelModel]) {
        self.selectedChannels = selectedChannels
    }
}

//
//  ChannelDetailsViewModel.swift
//  MarketingApp
//
//  Created by Alexandra on 02.04.2024.
//

import Foundation

class ChannelDetailsViewModel: ObservableObject {
    @Published var channel: ChannelModel
    @Published var selectionIndex: Int {
        didSet {
            for index in 0..<channel.campaigns.count {
                channel.campaigns[index].isSelected = selectionIndex == index ? true : false
            }
        }
    }
    
    init(channel: ChannelModel) {
        self.channel = channel
        self.selectionIndex = channel.campaigns.count
    }
}

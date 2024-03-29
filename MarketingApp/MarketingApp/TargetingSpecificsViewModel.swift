//
//  TargetingSpecificsViewModel.swift
//  MarketingApp
//
//  Created by Alexandra on 29.03.2024.
//

import Foundation

class TargetingSpecificsViewModel: ObservableObject {
    var channels: [ChannelModel]
    
    @Published var targetingSpecifics: [String]
    @Published var listOfSelections = Set<String>() {
        didSet {
            isButtonActive = findChannelsForSelection().isEmpty ? false : true
        }
    }
    @Published var isButtonActive = false

    init(channels: [ChannelModel]) {
        self.channels = channels
        
        targetingSpecifics = {
            var targetingSpecifics = [String]()
            channels.forEach { channel in
                targetingSpecifics.append(contentsOf: channel.targetingSpecifics)
            }
            
            return Array(Set(targetingSpecifics))
        }()
    }
    
    func findChannelsForSelection() -> [ChannelModel] {
        var channelsForSelection = [ChannelModel]()

        guard !listOfSelections.isEmpty else { return channelsForSelection }
        
        channels.forEach { channel in
            if Set(channel.targetingSpecifics).isSuperset(of: listOfSelections) {
                channelsForSelection.append(channel)
            }
        }
        
        return channelsForSelection
    }
}

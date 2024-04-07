//
//  TargetingSpecificsViewModel.swift
//  MarketingApp
//
//  Created by Alexandra on 29.03.2024.
//

import Foundation

class TargetingSpecificsViewModel: ObservableObject {
    var channels: [ChannelModel]? {
        didSet {
            targetingSpecifics = getAllTargetingSpecifics()
        }
    }
    
    @Published var targetingSpecifics = [String]()
    @Published var listOfSelections = Set<String>() {
        didSet {
            buttonText = getChannelsForSelection().isEmpty ? "No matching results" : "Continue"
            isButtonActive = getChannelsForSelection().isEmpty ? false : true
        }
    }
    @Published var isButtonActive = false
    @Published var buttonText = "No matching results"
    
    func getChannelsForSelection() -> [ChannelModel] {
        var channelsForSelection = [ChannelModel]()

        guard !listOfSelections.isEmpty else { return channelsForSelection }
        
        guard let channels = channels else { return channelsForSelection }
        
        channels.forEach { channel in
            if Set(channel.targetingSpecifics).isSuperset(of: listOfSelections) {
                channelsForSelection.append(channel)
            }
        }
        
        return channelsForSelection
    }
    
    func getAllTargetingSpecifics() -> [String] {
        var targetingSpecifics = [String]()
        
        guard let channels = channels else { return targetingSpecifics }

        channels.forEach { channel in
            targetingSpecifics.append(contentsOf: channel.targetingSpecifics)
        }
        
        return Array(Set(targetingSpecifics)).sorted { $0.lowercased() < $1.lowercased() }
    }
    
    func downloadChannels() {
        NetworkManager.instance.getChannels { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let resultChannels):
                    self.channels = resultChannels
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

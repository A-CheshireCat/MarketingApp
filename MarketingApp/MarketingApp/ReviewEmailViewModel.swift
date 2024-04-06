//
//  ReviewEmailViewModel.swift
//  MarketingApp
//
//  Created by Alexandra on 04.04.2024.
//

import Foundation
import MessageUI

class ReviewEmailViewModel: ObservableObject {
    var selectedChannels: [ChannelModel]
    @Published var result: Result<MFMailComposeResult, Error>? = nil
    @Published var isShowingMailView = false

    init(selectedChannels: [ChannelModel]) {
        self.selectedChannels = selectedChannels
    }
}

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
    var buttonText: String {
        MFMailComposeViewController.canSendMail() ? "Send Email" : "Can't send emails from this device"
    }
    var isButtonActive = MFMailComposeViewController.canSendMail()
    var emailTitle = "Selected Campaigns"
    var emailBody: String {
        var bodyText = "Your selected campaigns are: \n\n"
        selectedChannels.forEach { channel in
            bodyText += channel.name + "\n"
            bodyText += "\(channel.campaigns[0].monthlyFee)\n"

            channel.campaigns[0].details.forEach { detail in
                bodyText += detail + "\n"
            }
            bodyText += "\n"
        }
        return bodyText
    }
    var recipients: [String] = ["bogus@bogus.com"]
    
    @Published var isShowingMailView = false
    @Published var result: Result<MFMailComposeResult, Error>? = nil


    init(selectedChannels: [ChannelModel]) {
        self.selectedChannels = selectedChannels
    }
}

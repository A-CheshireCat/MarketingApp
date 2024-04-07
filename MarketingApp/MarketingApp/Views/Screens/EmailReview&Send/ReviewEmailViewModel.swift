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
        var bodyText = "Your selected campaigns are: <br><br>"
        selectedChannels.forEach { channel in
            bodyText += channel.name + "<br>"
            bodyText += "\(channel.campaigns[0].monthlyFee) euro / month<br>"

            channel.campaigns[0].details.forEach { detail in
                bodyText += detail + "<br>"
            }
            bodyText += "<br>"
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

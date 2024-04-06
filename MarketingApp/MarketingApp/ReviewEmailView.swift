//
//  ReviewEmailView.swift
//  MarketingApp
//
//  Created by Alexandra on 04.04.2024.
//

import SwiftUI
import MessageUI

struct ReviewEmailView: View {
    @StateObject var viewModel: ReviewEmailViewModel
    
    var body: some View {
        //Testing, to remove later
        if viewModel.result != nil {
            Text("Result: \(String(describing: viewModel.result))")
                .lineLimit(nil)
        }
        //------------------------
        List {
            ForEach(viewModel.selectedChannels, id: \.self){ channel in
                Section(channel.name, content: {
                    CampaignCardView(campaign: channel.campaigns[0])
                        .background(.green)
                })
            }
        }
        .listStyle(.insetGrouped)
        
        Button {
            viewModel.isShowingMailView.toggle()
        } label: {
            Text(MFMailComposeViewController.canSendMail() ? "Send Email" : "Can't send emails from this device")
        }
        .disabled(!MFMailComposeViewController.canSendMail())
        
        .sheet(isPresented: $viewModel.isShowingMailView) {
            SendMailView(isShowing: $viewModel.isShowingMailView, result: $viewModel.result)
        }
        
        .navigationTitle("Review")
    }
}

#Preview {
    ReviewEmailView(viewModel: ReviewEmailViewModel(selectedChannels: MockDataModel.mockData))
}

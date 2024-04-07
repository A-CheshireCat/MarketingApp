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
        List(viewModel.selectedChannels, id: \.self) { channel in
            Section(channel.name, content: {
                CampaignCardView(campaign: channel.campaigns[0])
                    .background(.green)
            })
        }
        .listStyle(.insetGrouped)
        
        Button {
            viewModel.isShowingMailView.toggle()
        } label: {
            Text(viewModel.buttonText)
        }
        .disabled(!viewModel.isButtonActive)
        .padding()
        
        .sheet(isPresented: $viewModel.isShowingMailView) {
            SendMailView(isShowing: $viewModel.isShowingMailView,
                         result: $viewModel.result,
                         emailTitle: viewModel.emailTitle,
                         emailBody: viewModel.emailBody,
                         recipients: viewModel.recipients)
        }
        
        .navigationTitle("Review")
    }
}

#Preview {
    ReviewEmailView(viewModel: ReviewEmailViewModel(selectedChannels: MockDataModel.mockData))
}

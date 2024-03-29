//
//  MockDataModel.swift
//  MarketingApp
//
//  Created by Alexandra on 29.03.2024.
//

import Foundation

struct MockDataModel {
    static var mockData: [ChannelModel] =
    [ChannelModel(name: "Facebook",
                  targetingSpecifics: ["Location", "Age", "Sex", "Spoken languages", "Events"],
                  campaigns: [CampaignModel(monthlyFee: 200,
                                            details: ["8-15 listings", "20 optimizations", "Campaign setup", "Admin and optimising", "Email support", "Monthly reports", "Install", "Conversion monitoring", "Landing page", "Phone support", "Remarketing"]),
                              CampaignModel(monthlyFee: 140,
                                            details: ["3-8 listings", "12 optimizations", "Campaign setup", "Admin and optimising", "Email support", "Monthly reports", "Install", "Conversion monitoring", "Landing page"]),
                              CampaignModel(monthlyFee: 100,
                                            details: ["1-3 listings", "8 optimizations", "Campaign setup", "Admin and optimising", "Email support", "Monthly reports", "Install", "Conversion monitoring"]),
                              CampaignModel(monthlyFee: 75,
                                            details: ["1 Facebook page", "8 optimizations", "Campaign setup", "Admin and optimising", "Email support", "Monthly reports"])
                  ]),
     ChannelModel(name: "LinkedIn",
                  targetingSpecifics: ["Location", "Age", "Sex", "Company", "Industry", "Expertise", "Education"],
                  campaigns: [CampaignModel(monthlyFee: 180,
                                            details: ["8-10 listings", "Campaign setup", "Admin and optimising", "Email support", "Monitoring", "Monthly reports", "Phone support"]),
                              CampaignModel(monthlyFee: 150,
                                            details: ["5-8 listings", "Campaign setup", "Admin and optimising", "Email support", "Monitoring", "Monthly reports"]),
                              CampaignModel(monthlyFee: 90,
                                            details: ["1-3 listings", "Campaign setup", "Admin and optimising", "Email support", "Monthly reports"]),
                              CampaignModel(monthlyFee: 60,
                                            details: ["1-2 listings", "Campaign setup", "Admin and optimising", "Email support"])
                  ]),
     ChannelModel(name: "Twitter",
                  targetingSpecifics: ["Location", "Age", "Sex", "Spoken languages", "Events", "Technology"],
                  campaigns: [CampaignModel(monthlyFee: 250,
                                            details: ["15-20 listings", "Campaign setup", "Campaign auctioning", "Targeted tweets", "Email support", "Admin and optimising", "Monthly reports", "Phone support"]),
                              CampaignModel(monthlyFee: 170,
                                            details: ["10-15 listings", "Campaign setup", "Campaign auctioning", "Targeted tweets", "Email support", "Admin and optimising", "Monthly reports"]),
                              CampaignModel(monthlyFee: 120,
                                            details: ["5-10 listings", "Campaign setup", "Campaign auctioning", "Targeted tweets", "Email support", "Admin and optimising"]),
                              CampaignModel(monthlyFee: 80,
                                            details: ["1-5 listings", "Campaign setup", "Campaign auctioning", "Targeted tweets", "Email support"])
                  ]),
     ChannelModel(name: "Instagram",
                  targetingSpecifics: ["Location", "Age", "Sex", "Spoken languages", "Interests"],
                  campaigns: [CampaignModel(monthlyFee: 270,
                                            details: ["10-12 listings", "8 optimizations", "Campaign setup", "Campaign testing", "Campaign analysis", "Monitoring", "Email support", "Phone support"]),
                              CampaignModel(monthlyFee: 180,
                                            details: ["5-8 listings", "4 optimizations", "Campaign setup", "Campaign testing", "Campaign analysis", "Email support"]),
                              CampaignModel(monthlyFee: 130,
                                            details: ["1-4 listings", "2 optimizations", "Campaign setup", "Campaign analysis", "Email support"]),
                              CampaignModel(monthlyFee: 80,
                                            details: ["1 listing", "Campaign setup", "Email support"])
                  ]),
     ChannelModel(name: "Google AdWords",
                  targetingSpecifics: ["Location", "Age", "Sex", "Device", "Keywords", "Similar products/services"],
                  campaigns: [CampaignModel(monthlyFee: 230,
                                            details: ["5 optimizations", "Campaign setup", "Content creation", "Admin and monitoring", "Monthly reports", "Email support", "Phone support"]),
                              CampaignModel(monthlyFee: 150,
                                            details: ["3 optimizations", "Campaign setup", "Content creation", "Admin and monitoring", "Email support"]),
                              CampaignModel(monthlyFee: 90,
                                            details: ["1 optimization", "Campaign setup", "Content creation", "Email support"])
                  ]),
     ChannelModel(name: "SEO",
                  targetingSpecifics: ["Industry", "Keywords", "Hyperlinks"],
                  campaigns: [CampaignModel(monthlyFee: 320,
                                            details: ["Scope setup", "Market research", "Keywords research", "Content analysis", "Hyperlinks analysis", "Local SEO", "Audit SEO", "Website optimisation", "Backlink setup", "Campaign analysis", "Email support"]),
                              CampaignModel(monthlyFee: 270,
                                            details: ["Scope setup", "Market research", "Keywords research", "Content analysis", "Hyperlinks analysis", "Local SEO",  "Website optimisation", "Backlink setup", "Campaign analysis", "Email support"]),
                              CampaignModel(monthlyFee: 180,
                                            details: ["Scope setup", "Market research", "Keywords research", "Content analysis", "Hyperlinks analysis", "Local SEO",  "Backlink setup", "Email support"]),
                              CampaignModel(monthlyFee: 110,
                                            details: ["Scope setup", "Market research", "Keywords research", "Content analysis", "Local SEO", "Email support"])
                  ])
    ]
}

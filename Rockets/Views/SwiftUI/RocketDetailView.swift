//
//  RocketDetailView.swift
//  Rockets
//
//  Created by Florin Uscatu on 20.02.2021.
//

import SwiftUI

struct RocketDetailView: View {
    
    let viewModel: RocketDetailViewModel
    
    var successRateColor: Color {
        switch viewModel.successRateLevel {
        case .high: return .green
        case .mid: return .orange
        case .low: return .red
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10.0) {
                Text(viewModel.name).font(.largeTitle)
                Text(viewModel.successRate)
                    .frame(width: 60,
                           height: 60,
                           alignment: .center)
                    .background(successRateColor)
                    .font(.system(size: 18,
                                  weight: .semibold,
                                  design: .default))
                    .cornerRadius(10.0)
                Text(viewModel.active)
                Text(viewModel.country)
                Text(viewModel.dateOfFirstLaunch)
                Text(viewModel.costPerLaunch)
                Spacer(minLength: 10.0)
                Text(viewModel.description)
                Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
            .padding(10)
        }
    }
}

struct RocketDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let rocket = Rocket(name: "Falcon 1",
                            imageUrl: "www.google.com",
                            successRate: 60,
                            active: true,
                            country: "USA",
                            description: "Big Rocket",
                            dateOfFirstFlight: "2006-03-24",
                            costPerLaunch: 50000,
                            wikipediaUrl: "www.wikipedia.com")
        let viewModel = RocketDetailViewModel(rocket: rocket)
        RocketDetailView(viewModel: viewModel)
    }
}

//
//  RocketDetailView.swift
//  Rockets
//
//  Created by Florin Uscatu on 20.02.2021.
//

import SwiftUI

struct RocketDetailView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    let viewModel: RocketDetailViewModel
    
    private let paddingConstant: CGFloat = 10.0
    private let cornerRadiusConstant: CGFloat = 10.0
    private let segmentSpacing: CGFloat = 20.0
    private let elementSpacing: CGFloat = 10.0
    
    private var successRateColor: Color {
        switch viewModel.successRateLevel {
        case .high: return .green
        case .mid: return .orange
        case .low: return .red
        }
    }
    
    private var image: RemoteImage? {
        do {
            return try RemoteImage(url: viewModel.imageUrl)
        } catch {
            return nil
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading,
                   spacing: segmentSpacing) {
                createHeaderView()
                createStatsView()
                Text(viewModel.description)
                createInfoView()
            }
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   alignment: .topLeading)
            .padding(paddingConstant)
        }
    }
    
    private func createHeaderView() -> some View {
        VStack(alignment: .leading,
               spacing: elementSpacing) {
            Text(viewModel.name).font(.largeTitle)
            Text(viewModel.successRate)
                .frame(minWidth: 160,
                       maxWidth: horizontalSizeClass == .regular ? 300 : .infinity,
                       minHeight: 44,
                       alignment: .center)
                .background(successRateColor)
                .font(.system(size: 18,
                              weight: .semibold,
                              design: .default))
                .cornerRadius(cornerRadiusConstant)
        }
    }
    
    private func createStatsView() -> some View {
        VStack(alignment: .leading,
               spacing: elementSpacing) {
            Text(viewModel.active).bold()
            Text(viewModel.country).bold()
            Text(viewModel.dateOfFirstLaunch).bold()
            Text(viewModel.costPerLaunch).bold()
        }
    }
    
    private func createInfoView() -> some View {
        VStack(alignment: .center,
               spacing: elementSpacing) {
            image
                .aspectRatio(contentMode: .fit)
                .cornerRadius(cornerRadiusConstant)
            if let wikipediaURL = viewModel.wikipediaURL {
                Link("Wikipedia", destination: wikipediaURL)
                    .frame(minWidth: 100,
                           maxWidth: horizontalSizeClass == .regular ? 300 : .infinity,
                           minHeight: 44)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(cornerRadiusConstant)
            }
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

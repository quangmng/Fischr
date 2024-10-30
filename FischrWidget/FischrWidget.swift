//
//  FischrWidget.swift
//  FischrWidget
//
//  Created by Wendy Zhou on 30/10/2024.
//

import WidgetKit
import SwiftUI
import CoreData
 


struct SimpleEntry: TimelineEntry {
	let date: Date
	let position: String
	let isFavourite: Bool
	let pieces: [String]
}

struct Provider: TimelineProvider {
	let viewModel = GenerateViewModel()

	func placeholder(in context: Context) -> SimpleEntry {
		SimpleEntry(date: Date(), position: "959", isFavourite: false, pieces: ["B", "B", "B", "B", "B", "B", "B", "B"] )
	}

	func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
		let latestPosition = viewModel.fetchLatestPosition()
		let entry = SimpleEntry(
			date: Date(),
			position: latestPosition?.positionGenerated ?? "959",
			isFavourite: latestPosition?.isFavourite ?? false, pieces: []
		)
		completion(entry)
	}
	
	func getSnapshot2(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
		let pieces = ["N", "R", "Q", "B", "K", "B", "N", "R"] // Example setup
		let entry = SimpleEntry(date: Date(), position: "959", isFavourite: true, pieces: pieces)
		completion(entry)
	}

	func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
		let pieces = ["N", "R", "Q", "B", "K", "B", "N", "R"] // Example setup
		let entry = SimpleEntry(date: Date(), position: "959", isFavourite: true, pieces: pieces)

		let timeline = Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(3600)))
		completion(timeline)
	}


	func getTimeline2(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
		let latestPosition = viewModel.fetchLatestPosition()
		let entry = SimpleEntry(
			date: Date(),
			position: latestPosition?.positionGenerated ?? "959",
			isFavourite: latestPosition?.isFavourite ?? false, pieces: ["B", "B", "B", "B", "B", "B", "B", "B"]
		)
		
		let timeline = Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(3600)))
		completion(timeline)
	}
}

struct FischrWidgetEntryView: View {
	var entry: SimpleEntry

	var body: some View {
		VStack {
			HStack {
				Text("Pos \(entry.position)")
					.font(.headline)
				Spacer()

				// Randomize: Opens the app to generate a new position
				Link(destination: URL(string: "fischr://randomise")!) {
					Image(systemName: "shuffle")
				}

				// Toggle Favorite: Opens the app to toggle favorite
				Link(destination: URL(string: "fischr://save")!) {
					Image(systemName: entry.isFavourite ? "heart.fill" : "heart")
						.foregroundColor(entry.isFavourite ? .red : .gray)
				}
			}
			.padding(.horizontal)

			HStack {
							ForEach(entry.pieces, id: \.self) { piece in
								Image(piece) // Display the piece image
									.resizable()
									.aspectRatio(contentMode: .fit)
									.frame(width: 30, height: 30)
									.background(Color.gray.opacity(0.3))
									.cornerRadius(5)
							}
						}
			.padding(.vertical)
		}
		.padding()
		.containerBackground(Color(.systemBackground), for: .widget)
	}
}


struct FischrWidget: Widget {
	let kind: String = "FischrWidget"

	var body: some WidgetConfiguration {
		StaticConfiguration(kind: kind, provider: Provider()) { entry in
			FischrWidgetEntryView(entry: entry)
		}
		.configurationDisplayName("Fischr Position Widget")
		.description("Displays the latest position and allows you to randomize or favorite it.")
		.supportedFamilies([.systemMedium]) // Only supports medium size
	}
}

#Preview(as: .systemMedium) {
	FischrWidget()
} timeline: {
	SimpleEntry(date: .now, position: "959", isFavourite: true, pieces: ["B", "B", "B", "B", "B", "B", "B", "B"])
}

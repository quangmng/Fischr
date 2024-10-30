//
//  FischrWidget.swift
//  FischrWidget
//
//  Created by Wendy Zhou on 30/10/2024.
//

import WidgetKit
import SwiftUI
import CoreData

struct Provider: TimelineProvider {
	let viewModel = GenerateViewModel() // Now accessible

	func placeholder(in context: Context) -> SimpleEntry {
		SimpleEntry(date: Date(), position: "Placeholder", isFavourite: false)
	}

	func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
		let latestPosition = viewModel.fetchLatestPosition()
		let entry = SimpleEntry(
			date: Date(),
			position: latestPosition?.positionGenerated ?? "No Position",
			isFavourite: latestPosition?.isFavourite ?? false
		)
		completion(entry)
	}

	func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
		var entries: [SimpleEntry] = []

		let latestPosition = viewModel.fetchLatestPosition()
		let entry = SimpleEntry(
			date: Date(),
			position: latestPosition?.positionGenerated ?? "No Position",
			isFavourite: latestPosition?.isFavourite ?? false
		)
		entries.append(entry)

		let timeline = Timeline(entries: entries, policy: .after(Date().addingTimeInterval(3600)))
		completion(timeline)
	}
}

struct SimpleEntry: TimelineEntry {
	let date: Date
	let position: String
	let isFavourite: Bool
}

struct FischrWidgetEntryView: View {
	var entry: SimpleEntry

	var body: some View {
		VStack {
			Text("Current Position:")
				.font(.headline)

			Text(entry.position)
				.font(.title3)
				.padding(.bottom, 8)

			HStack {
				Image(systemName: entry.isFavourite ? "heart.fill" : "heart")
					.foregroundColor(entry.isFavourite ? .red : .gray)
				Text(entry.isFavourite ? "Favorite" : "Not Favorite")
					.font(.caption)
			}

			Text("Updated:")
			Text(entry.date, style: .time)
				.font(.caption)
		}
		.padding()
	}
}

struct FischrWidget: Widget {
	let kind: String = "FischrWidget"

	var body: some WidgetConfiguration {
		StaticConfiguration(kind: kind, provider: Provider()) { entry in
			FischrWidgetEntryView(entry: entry)
		}
		.configurationDisplayName("Fischr Widget")
		.description("View the latest generated position.")
		.supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
	}
}

#Preview(as: .systemSmall) {
	FischrWidget()
} timeline: {
	SimpleEntry(date: .now, position: "Sample", isFavourite: true)
}

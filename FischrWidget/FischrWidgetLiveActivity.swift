//
//  FischrWidgetLiveActivity.swift
//  FischrWidget
//
//  Created by Wendy Zhou on 30/10/2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct FischrWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct FischrWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: FischrWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension FischrWidgetAttributes {
    fileprivate static var preview: FischrWidgetAttributes {
        FischrWidgetAttributes(name: "World")
    }
}

extension FischrWidgetAttributes.ContentState {
    fileprivate static var smiley: FischrWidgetAttributes.ContentState {
        FischrWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: FischrWidgetAttributes.ContentState {
         FischrWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: FischrWidgetAttributes.preview) {
   FischrWidgetLiveActivity()
} contentStates: {
    FischrWidgetAttributes.ContentState.smiley
    FischrWidgetAttributes.ContentState.starEyes
}

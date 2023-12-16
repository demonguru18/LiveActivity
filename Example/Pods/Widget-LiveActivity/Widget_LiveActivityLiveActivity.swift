//
//  Widget_LiveActivityLiveActivity.swift
//  Widget-LiveActivity
//
//  Created by Techhowdy iMac on 2023-12-15.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct Widget_LiveActivityAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct Widget_LiveActivityLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: Widget_LiveActivityAttributes.self) { context in
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

extension Widget_LiveActivityAttributes {
    fileprivate static var preview: Widget_LiveActivityAttributes {
        Widget_LiveActivityAttributes(name: "World")
    }
}

extension Widget_LiveActivityAttributes.ContentState {
    fileprivate static var smiley: Widget_LiveActivityAttributes.ContentState {
        Widget_LiveActivityAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: Widget_LiveActivityAttributes.ContentState {
         Widget_LiveActivityAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: Widget_LiveActivityAttributes.preview) {
   Widget_LiveActivityLiveActivity()
} contentStates: {
    Widget_LiveActivityAttributes.ContentState.smiley
    Widget_LiveActivityAttributes.ContentState.starEyes
}

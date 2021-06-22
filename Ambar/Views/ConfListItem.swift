//
//  ConfListItem.swift
//  Ambar
//
//  Created by Zengrui Jin on 6/22/21.
//  Copyright © 2021 Golden Chopper. All rights reserved.
//

import EventKit
import SwiftUI

struct ConfListItem: View {
    
    @State var event: EKEvent
    @State var conferenceType: ConferenceType
    
    private let hourFormatter: DateFormatter = DateFormatter()
    
    
    
    var body: some View {
        HStack {
            ConferenceIcon
            Text(event.title)
            Spacer()
            Text("\(self.formatDate(date: event.startDate))")
                .foregroundColor(.gray)
        }
    }
    
    private var ConferenceIcon: some View {
        var icon: Image!
        switch conferenceType {
            case .zoom:
                icon = Image(systemName: "arrow.up.right.video")
            case .facetime:
                icon = Image(systemName: "arrow.up.right.video")
            case .teams:
                icon = Image(systemName: "arrow.up.right.video")
            case .google:
                icon = Image(systemName: "arrow.up.right.video")
            case .tencent:
                icon = Image(systemName: "arrow.up.right.video")
        }
        return icon
    }
    
    private func formatDate(date: Date) -> String {
        self.hourFormatter.dateFormat = "hh:mm"
        return hourFormatter.string(from: date)
    }
}

struct ConfListItem_Previews: PreviewProvider {
    static var previews: some View {
//        ConfListItem(
//            conferenceType: .facetime,
//            eventTitle: "Meeting w. Prof. Liu",
//            time: Date()
//        )
        Text("No Preview")
    }
}

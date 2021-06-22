//
//  ContentView.swift
//  Ambar
//
//  Created by Anagh Sharma on 12/11/19.
//  Copyright © 2019 Anagh Sharma. All rights reserved.
//

import SwiftUI
import AppKit

struct ContentView: View {
    
    let calendarAgent = CalendarAgent(
        eventRange: .oneWeek) { result in
        print(result)
    } errorHandler: { error in
        print(error)
    }
    
    
    var body: some View {
        List {
            Section(header: Text("Events")) {
                ForEach(calendarAgent.events!, id: \.eventIdentifier) { event in
                    Button(
                        action: {
                            if let url = URL(string: "\(event.url!)") {
                                NSWorkspace.shared.open(url)
                            }
                        },
                        label: {
                            ConfListItem(event: event, conferenceType: .facetime)
                        }
                    ).buttonStyle(BorderlessButtonStyle())
                }
            }
            
            Divider()
            
            Section(header: Text("Speed Dial")) {
                Text("Hello")
            }
            
            Divider()
            
            Section(header: Text("General")) {
                ForEach(0..<1) { item in
                    Button {
                        
                    } label: {
                        PreferenceListItem()
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
            }
            
            Divider()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

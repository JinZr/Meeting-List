//
//  CalendarAgent.swift
//  Ambar
//
//  Created by Zengrui Jin on 6/22/21.
//  Copyright © 2021 Golden Chopper. All rights reserved.
//

import EventKit

class CalendarAgent {
    
    private(set) var eventRange: CalendarEventRange
    
    // Initialize the store.
    private var store: EKEventStore!
    
    var events: [EKEvent]? {
        get {
            // Get the appropriate calendar.
            let calendar = Calendar.current

            // Create the start date components
            var todayComponents = DateComponents()
            todayComponents.day = 0
            let today = calendar.date(byAdding: todayComponents, to: Date())

            // Create the end date components.
            var sevenDaysFromNowComponents = DateComponents()
            sevenDaysFromNowComponents.day = 7
            let sevenDaysFromNow = calendar.date(byAdding: sevenDaysFromNowComponents, to: Date())

            // Create the predicate from the event store's instance method.
            var predicate: NSPredicate? = nil
            if let anAgo = today, let aNow = sevenDaysFromNow {
                predicate = store.predicateForEvents(withStart: anAgo, end: aNow, calendars: nil)
            }
            
            // Fetch all events that match the predicate.
            if let aPredicate = predicate {
                print(store.events(matching: aPredicate))
                return store.events(matching: aPredicate).filter { event in
                    event.url != nil
                }
            } else {
                return nil
            }
        }
    }
    
    init(eventRange: CalendarEventRange,
         grantedHandler: @escaping (Bool) -> (),
         errorHandler: @escaping (Error) -> ()) {
        
        self.eventRange = eventRange
        self.store = EKEventStore()
        
        // Request access to reminders.
        switch EKEventStore.authorizationStatus(for: .event) {
            case .authorized:
                print("authorized")
            case .denied:
                print("Access denied")
            case .notDetermined:
                self.store.requestAccess(to: .event) { granted, error in
                    if let err = error {
                        errorHandler(err)
                    }
                    grantedHandler(granted)
                }
            default:
                print("Case Default")
        }
        
        
        
    }
}

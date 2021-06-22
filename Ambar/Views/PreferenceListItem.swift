//
//  PreferenceListItem.swift
//  Ambar
//
//  Created by Zengrui Jin on 6/22/21.
//  Copyright © 2021 Golden Chopper. All rights reserved.
//

import SwiftUI

struct PreferenceListItem: View {
    var body: some View {
        HStack {
            Image(systemName: "gear")
            Text("Preferences")
            Spacer()
            Text("⌘ ,").foregroundColor(.gray)
        }
    }
}

struct PreferenceListItem_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceListItem()
    }
}

//
//  SwiftUINavigationView.swift
//  SwiftUIDemo
//
//  Created by Joe on 2020/5/5.
//  Copyright © 2020 AngleMiku. All rights reserved.
//

import SwiftUI

struct SwiftUINavigationView: View {
    var body: some View {
        NavigationView {
            List(landmarkData) { landmark in
                LandmarkRow(landmark: landmark)
            }
            .navigationBarTitle(Text("Select Noise"))
        }
    }
}

#if DEBUG
struct SwiftUINavigationView_Previews: PreviewProvider {
    static var previews: some View {
        let deviceName = "iPhone SE"
        return SwiftUINavigationView()
        .previewDevice(PreviewDevice(rawValue: deviceName))
        .previewDisplayName(deviceName)
    }
}
#endif

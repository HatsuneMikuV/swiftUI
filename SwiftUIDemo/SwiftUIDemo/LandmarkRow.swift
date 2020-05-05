//
//  LandmarkRow.swift
//  SwiftUIDemo
//
//  Created by Joe on 2020/5/5.
//  Copyright © 2020 AngleMiku. All rights reserved.
//
import SwiftUI


struct LandmarkRow: View {
    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image(forSize: 50)
            Text(verbatim: landmark.name)
            Spacer()
        }
    }
}

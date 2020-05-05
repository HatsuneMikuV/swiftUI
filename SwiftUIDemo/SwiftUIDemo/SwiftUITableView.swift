//
//  SwiftUITableView.swift
//  SwiftUIDemo
//
//  Created by Joe on 2020/5/5.
//  Copyright © 2020 AngleMiku. All rights reserved.
//

import SwiftUI

struct SwiftUITableView: View {
    var body: some View {
        List(landmarkData) { landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}

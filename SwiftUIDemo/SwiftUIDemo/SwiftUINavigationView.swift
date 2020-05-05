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
            SwiftUITableView()
            .navigationBarTitle(Text("Select Noise"))
        }
    }
}

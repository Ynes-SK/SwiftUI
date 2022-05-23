//
//  ProgressView.swift
//  SwiftUIproj
//
//  Created by Ines Sakly on 17/3/2022.
//

import SwiftUI
struct ProgressView: View {
    @State var currentProgress: CGFloat = 0.0
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.blue)
                .frame(width: 300*currentProgress, height: 20)
        }
    }
}

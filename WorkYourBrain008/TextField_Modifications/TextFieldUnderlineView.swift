//
//  TextFieldUnderlineView.swift
//  WorkYourBrain008
//
//  Created by Cesar Almendarez on 2/4/20.
//  Copyright © 2020 Cesar Almendarez. All rights reserved.
//

import SwiftUI

struct HorizontalLineShape: Shape {
    func path(in rect: CGRect) -> Path {
        let fill = CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height)
        var path = Path()
        path.addRoundedRect(in: fill, cornerSize: CGSize(width: 2, height: 2))
        return path
    }
}

struct TextFieldUnderlineView: View {
    private var color: Color? = nil
    private var height: CGFloat = 2.0
    
    init(color: Color, height: CGFloat = 2.0) {
        self.color = color
        self.height = height
    }
    
    var body: some View {
    HorizontalLineShape().fill(self.color!).frame(minWidth: 0, maxWidth: .infinity, minHeight: height, maxHeight: height)
    }
}

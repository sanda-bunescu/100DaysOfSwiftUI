//
//  Separator.swift
//  Moonshot
//
//  Created by Sanda Bunescu on 22.09.2023.
//

import SwiftUI

struct Separator: View {
    let alocatedLength: Double
    var body: some View {
        GeometryReader{geo in
            Divider()
                .frame(width: geo.size.width * alocatedLength)
                .background(.white)
        }
    }
}

struct Separator_Previews: PreviewProvider {
    static var previews: some View {
        Separator(alocatedLength: 0.9)
    }
}

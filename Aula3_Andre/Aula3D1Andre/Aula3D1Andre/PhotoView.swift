//
//  PhotoView.swift
//  Aula3D1Andre
//
//  Created by Student on 04/09/23.
//

import SwiftUI

struct PhotoView: View {
    private var imageList = [
        "hare.fill",
     "tortoise.fill",
       "pawprint.fill",
        "ant.fill",
        "ladybug.fill"
     ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(imageList, id:\.self) { index in Image(systemName: "\(index)")
                    .font(.system(size: 150))
                    .padding()
            }
        }
    }
}

struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}

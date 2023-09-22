//
//  MusicView.swift
//  Aula4Andre
//
//  Created by Student on 05/09/23.
//

import SwiftUI


struct MusicView: View {
   let arrayMusic: [song]
    
    var body: some View {
        NavigationStack{
        ZStack { LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack{


                HStack{
                    Image(systemName: "shuffle")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.white)
                        .frame(width: 40, height: 40)
                        .padding()
                    Image(systemName: "backward.end.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.white)
                        .frame(width: 30, height: 40)
                    Spacer()
                    
                    Image(systemName: "play.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.white)
                        .frame(width: 50, height: 50)
                        .padding()
                    Spacer()
                    
                    Image(systemName: "forward.end.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.white)
                        .frame(width: 30, height: 40)
                    
                    Image(systemName: "repeat")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.white)
                        .frame(width: 40, height: 40)
                        .padding()
                    }
                }
            }
        }
    }
}


struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView(arrayMusic: arrayMusic)
    }
}

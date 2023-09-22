//
//  ContentView.swift
//  Aula4Andre
//
//  Created by Student on 05/09/23.
//

import SwiftUI

struct song: Identifiable {
    var id = UUID()
    var name: String
    var artist: String
    var image: URL?
    
}
struct playlist: Identifiable {
    var id = UUID()
    var name: String
    var image: URL?
}
  var arrayPlay = [
   playlist(name:"Dance!", image:  URL(string: "https://upload.wikimedia.org/wikipedia/commons/6/64/Aerobarmiami.jpg")),
    playlist(name:"Classic",image:  URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Teatro_alla_Scala_interior_Milan.jpg/600px-Teatro_alla_Scala_interior_Milan.jpg"))
]

var arrayMusic = [
    song(name:"Numb", artist: "Linkin Park", image:  URL(string: "https://upload.wikimedia.org/wikipedia/pt/b/b9/Linkin_Park_-_Numb_CD_cover.jpg")),
    song(name:"Lost", artist: "Linkin Park", image:  URL(string: "https://upload.wikimedia.org/wikipedia/pt/5/5d/Linkin_Park_-_Lost.jpg"))
]



struct ContentView: View {

    var body: some View {
        
        
        NavigationStack{
            ZStack { LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    AsyncImage(url: URL(string: "https://www.eldorado.org.br/wp-content/uploads/2020/02/20200204_cc338f74e4da402fb39dab233d5eec06_novo-actros-hackatruck-2-scaled-1.jpg")) { image in image.resizable() } placeholder: { Color.red } .frame(width: 128, height: 128) .clipShape(RoundedRectangle(cornerRadius: 25))
                    Text(" My Playlist")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                    
                    
                    HStack{
                        AsyncImage(url: URL(string: "https://www.eldorado.org.br/wp-content/uploads/2020/02/20200204_cc338f74e4da402fb39dab233d5eec06_novo-actros-hackatruck-2-scaled-1.jpg")) { image in image.resizable() } placeholder: { Color.red } .frame(width: 50, height: 50) .clipShape(RoundedRectangle(cornerRadius: 25))
                        Text("Playlist")
                            .font(.title3)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.leading)
                            .bold()
                        
                    }
                    Spacer()
                    ScrollView(.vertical) {
                        ForEach(arrayMusic) { item in
                            HStack{ AsyncImage(url: item.image) { image in image.resizable() } placeholder: { Color.red } .frame(width: 50, height: 50)
                                VStack{Text(item.name)
                                        .foregroundColor(Color.white)
                                        .bold()
                                    Text(item.artist)
                                        .foregroundColor(Color.white)
                                }
                                Spacer()
                                    NavigationLink(destination: MusicView(arrayMusic: arrayMusic)){Image(systemName: "ellipsis")
                                        .foregroundColor(.white)}
                            }
                        }
                        Text("Sugerido")
                            .foregroundColor(Color.white)
                            .bold()
                            .font(.title)
                        
                        ScrollView(.horizontal) {
                            HStack{
                            ForEach(arrayPlay) { item in
                               
                                    VStack{
                                        AsyncImage(url: item.image) { image in image.resizable() } placeholder: { Color.red } .frame(width: 200, height: 200)
                            
                        Text(item.name)
                                                .foregroundColor(Color.white)
                                    }
                                }
                                
                            }
                        }
                        .padding()
                    }
                }
            }
        } .tint(.white)
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

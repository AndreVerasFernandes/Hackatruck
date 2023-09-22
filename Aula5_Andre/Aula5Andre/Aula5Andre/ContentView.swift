//
//  ContentView.swift
//  Aula5Andre
//
//  Created by Student on 06/09/23.
//

import SwiftUI
import MapKit


struct AnyMapAnnotationProtocol: MapAnnotationProtocol {
  let _annotationData: _MapAnnotationData
  let value: Any

  init<WrappedType: MapAnnotationProtocol>(_ value: WrappedType) {
    self.value = value
    _annotationData = value._annotationData
  }
}



let annotation = MKPointAnnotation()

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let Flag: String
    let desc: String
}
var local = [           Location(name:"Brazil", coordinate: CLLocationCoordinate2D(latitude: -15.7801, longitude: -47.9292),  Flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/2560px-Flag_of_Brazil.svg.png", desc: "O Brasil é o maior país da América do Sul e o quinto maior do mundo em área geográfica. Localizado na América do Sul, o Brasil faz fronteira com quase todos os países sul-americanos, exceto Chile e Equador. Com uma população diversificada de mais de 200 milhões de habitantes, o país é conhecido por sua rica diversidade cultural e geográfica. A capital do Brasil é Brasília, embora as cidades mais conhecidas sejam Rio de Janeiro e São Paulo."),
                        Location(name:"USA", coordinate: CLLocationCoordinate2D(latitude: 38.9041, longitude: -77.0171),  Flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/2560px-Flag_of_Brazil.svg.png", desc: "O Brasil é o maior país da América do Sul e o quinto maior do mundo em área geográfica. Localizado na América do Sul, o Brasil faz fronteira com quase todos os países sul-americanos, exceto Chile e Equador. Com uma população diversificada de mais de 200 milhões de habitantes, o país é conhecido por sua rica diversidade cultural e geográfica. A capital do Brasil é Brasília, embora as cidades mais conhecidas sejam Rio de Janeiro e São Paulo.")]

let annotations = [local]
struct ContentView: View {
    @State private var region =
    MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40))
    
    @State private var showingSheet = false
    @State private var selectedItem: Location?
    @State private var topName = ""

    @State var selectL: Location = Location(name:"Brazil", coordinate: CLLocationCoordinate2D(latitude: -15.7801, longitude: -47.9292),  Flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/2560px-Flag_of_Brazil.svg.png", desc: "O Brasil é o maior país da América do Sul e o quinto maior do mundo em área geográfica. Localizado na América do Sul, o Brasil faz fronteira com quase todos os países sul-americanos, exceto Chile e Equador. Com uma população diversificada de mais de 200 milhões de habitantes, o país é conhecido por sua rica diversidade cultural e geográfica. A capital do Brasil é Brasília, embora as cidades mais conhecidas sejam Rio de Janeiro e São Paulo.")
    
    var body: some View {
        NavigationStack {
            ZStack{
                VStack {
                    Text("World map")
                        .font(.title)
                        .bold()
                    Text("\(topName)")
                    //Text(\(location.name))
                    Spacer()
                    Map(coordinateRegion: $region, annotationItems: local){
                        item in
                        AnyMapAnnotationProtocol(MapAnnotation(coordinate: item.coordinate) {
                                        HStack {
                                            Image(systemName: "map.circle")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .clipShape(Capsule())
                                        .onTapGesture {
                                        
                 
                        
                                            showingSheet.toggle()
                                }
                                        .sheet(isPresented: $showingSheet) {
                                            VStack{                  Text("\(selectL.name)")
                                                    .bold()
                                                    .font(.title)
                                                AsyncImage(url: URL(string: "\(selectL.Flag)"))  { image in image.resizable() } placeholder: { Color.red } .frame(width: 256, height: 128)

                                                Text("\(selectL.desc)")
                                            }
                                        }

                                            
                                        }
                                    })

                    }

                        .frame(width: 600, height: 600)
                        .padding()
                    let annotations = [local]
                    
                    ScrollView(.horizontal){HStack{  ForEach(local) { item in               Button("\(item.name)") {
                        topName = item.name
                        
                        selectL = item
                        region = MKCoordinateRegion(center: item.coordinate, span:MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40))
                       
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)

                    }                               }                               }                               }
                
                .padding()
            }
        }
    }
}


//struct SheetView: View {
//    @Environment(\.dismiss) var dismiss
//
//    var body: some View {
//        Text("oi")
//        Text("\(selectL.name)")
//
//        }
//    }





struct ContentView_Previews: PreviewProvider {

static var previews: some View {
        ContentView()
    }
}

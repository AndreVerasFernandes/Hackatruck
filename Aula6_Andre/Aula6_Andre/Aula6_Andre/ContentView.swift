//
//  ContentView.swift
//  Aula6_Andre
//
//  Created by Student on 11/09/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @State private var showingSheet = false

    var body: some View {
        NavigationStack {
            ZStack { LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Free games on PC!")
                        .font(.title)
                        .bold()
                        .foregroundColor(.black)
                    ScrollView(.vertical) {
                        ForEach(viewModel.pcgames){ index in
                            Button(index.title!) {
                                showingSheet.toggle()
             }
                            .font(.title2)
                            .tint(.white)
                            .bold()
                            .padding()
                            .sheet(isPresented: $showingSheet){
                                NavigationStack {
                                    ZStack { LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
                                            .edgesIgnoringSafeArea(.all)
                                        
                                        VStack {
                                            Text(index.title!)
                                                .font(.title)
                                                .bold()
                                                .foregroundColor(.black)
                                            Spacer()
                                            Text(index.short_description!)
                                                .font(.title3)
                                                .bold()
                                                .foregroundColor(.white)
                                            
                                            Text("Genre: \(index.genre!)")
                                                .font(.title3)
                                                .bold()
                                                .foregroundColor(.white)
                                                .padding()
                                            Text("Platform:: \(index.platform!)")
                                                .font(.title3)
                                                .bold()
                                                .foregroundColor(.white)
                                                .padding()
                                            Text("Published by \(index.publisher!)")
                                                .font(.title3)
                                                .bold()
                                                .foregroundColor(.white)
                                                .padding()
                                            Text("Developed by \(index.developer!)")
                                                .font(.title3)
                                                .bold()
                                                .foregroundColor(.white)
                                                .padding()
                                            Text("Release date: \(index.release_date!)")
                                                .font(.title3)
                                                .bold()
                                                .foregroundColor(.white)
                                                .padding()
                                            Spacer()

                                            
                                        }
                                        
                                    }
                                    
                                }

                            }
                            
                        }
                    }
                    
                }
                .padding()
            }
        }
        .onAppear(){
            viewModel.fetch()
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

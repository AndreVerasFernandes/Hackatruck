//
//  ContentView.swift
//  Aula2_Andre
//
//  Created by Student on 01/09/23.
//

import SwiftUI


struct ContentView: View {
    @State var res: Double = 0.0
    @State var altura: Double = 0.0
    @State var peso: Double = 0.0

    
    var backgroundColor: Color {
        switch res {
        case ..<18.5:
            return Color("underWeight")
        case 18.5..<25.0:
            return Color("averageWeight")
        case 25.0..<30.0:
            return Color("overWeight")
        default:
            return Color("Obesity")
        }
        var imcText: Text {
            switch res {
            case ..<18.5:
                return Text("Baixo peso")
            case 18.5..<25.0:
                return Text("Normal")
            case 25.0..<30.0:
                return Text("Sobrepeso")
            default:
                return Text("Obesidade")
            }
            
            var body: some View {
                ZStack{
                    
                    VStack {
                        
                        Text("Calculadora de IMC")
                            .font(.largeTitle)
                        TextField("Digite seu Altura", value: $peso, formatter: NumberFormatter())
                            .multilineTextAlignment(.center)
                            .keyboardType(.decimalPad)
                            .textContentType(.oneTimeCode)
                            .padding()
                            .background(.white)
                            .cornerRadius(5)
                        TextField("Digite seu Peso!", value: $peso, formatter: NumberFormatter())
                            .multilineTextAlignment(.center)
                            .keyboardType(.decimalPad)
                            .textContentType(.oneTimeCode)
                            .padding()
                            .background(.white)
                            .cornerRadius(5)
                        
                        Button("Calcular") {
                            
                            
                            let calculoAltura = altura / 100
                            let calculoIMC = peso / (calculoAltura * calculoAltura)
                            res = calculoIMC
                            print(res)
                        }
                        .frame(width: 200, height: 100)
                        .buttonStyle(.borderedProminent)
                        .tint(.blue)
                        
                        
                        Spacer()
                        imcText
                        
                        Image("IMC")
                            .resizable()
                            .scaledToFit()
                        
                        
                        
                    }
                } .background( Color("averageWeight")
                    .edgesIgnoringSafeArea(.all))
                
                .padding()
            }
            
        }
        
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
    }

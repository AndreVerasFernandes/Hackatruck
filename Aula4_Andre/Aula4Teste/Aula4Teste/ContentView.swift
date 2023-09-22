//
//  ContentView.swift
//  Aula4Teste
//
//  Created by Student on 05/09/23.
//

import SwiftUI
struct Company {
    struct Person: Identifiable {
         let id = UUID()
         var name: String
         var phoneNumber: String
     }

struct Department: Identifiable {
    let id = UUID()
    var name: String
    var staff: [Person]
}

    var person: Person

    var departments: [Department]
}


var company = Company(departments: [
    Department(name: "Sales", staff: [
        Person(name: "Juan Chavez", phoneNumber: "(408) 555-4301"),
        Person(name: "Mei Chen", phoneNumber: "(919) 555-2481"),
        // ...
    ]),
    Department(name: "Engineering", staff: [
        Person(name: "Bill James", phoneNumber: "(408) 555-4450"),
        Person(name: "Anne Johnson", phoneNumber: "(417) 555-9311"),
        // ...
    ]),
    // ...
])


struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack {
                NavigationView {
                    List {
                        ForEach(company.departments) { department in
                            Section(header: Text(department.name)) {
                                ForEach(department.staff) { person in
                                    NavigationLink(destination: PersonDetailView(person: person)) {
                                        PersonRowView(person: person)
                                    }
                                }
                            }
                        }
                    }
                    .navigationTitle("Staff Directory")
                    
                    
                    // Placeholder
                    Text("No Selection")
                        .font(.headline)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

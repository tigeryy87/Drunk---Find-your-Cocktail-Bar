//
//  ContentView.swift
//  Drunk
//
//  Created by Yin-Lin Chen on 2023/3/3.
//

//  Create a splash screen for user to clicked start

import SwiftUI

struct ContentView: View {

    let viewModel = MainViewModel()
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    
                    Image("drunk")
                        .resizable()
                        .scaledToFit()
                }.frame(height: 300)
                // text
                Text("DRUNK")
                    .font(.system(size: 66)).multilineTextAlignment(.center).foregroundColor(.white)
                Spacer()
                Text("Find your cocktail bar").font(.headline).foregroundColor(.white)
                Spacer()
                NavigationLink(destination: TabBar()
//                                MainView()
//                    .environmentObject(viewModel)
//                    .environment(\.managedObjectContext,
//                                viewModel.container.viewContext)
                ) {
                        Text("Get Started").bold()
                    }
                    .frame(width: 250, height: 20)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(30)
                    .shadow(radius: 10)
                    .foregroundColor(Color.blue)
                
            }
            .frame(width: 500)
            .background(Color.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

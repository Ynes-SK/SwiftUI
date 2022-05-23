//
//  ContentView.swift
//  SwiftUIproj
//
//  Created by Ines Sakly on 4/10/2021.
//

import SwiftUI
import NetworkingManager

struct ContentView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var selection: Int? = nil
    init() {
        UINavigationBar.appearance().backgroundColor = .purple
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().barTintColor = .purple
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }

    struct welcomeView: View {
        var body: some View {
            return Text("Welcome!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
        }
    }
    
    struct LoginButtonContent : View {
        
        var body: some View {
           return Text("LOGIN")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220, height: 60)
                            .background(Color.green)
                            .cornerRadius(15.0)
        }
    }
    
    struct userImage: View {
        @State private var half = false
        @State private var dim = false
        var body: some View {
            return Image("images")
                .resizable()
                .aspectRatio(UIImage(named: "images")!.size, contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipped()
                .cornerRadius(150)
                .padding(.bottom, 75)
                .scaleEffect(half ? 0.5 : 1.0)
                            .opacity(dim ? 0.2 : 1.0)
                            .animation(.easeInOut(duration: 1.0))
                            .onTapGesture {
                                self.dim.toggle()
                                self.half.toggle()
                            }
        }
    }

    var body: some View {
        NavigationView {
        ScrollView {
        VStack {
            welcomeView()
            userImage()
            TextField("Email", text: $email)
                            .padding()
                            .cornerRadius(5.0)
                            .textFieldStyle(.roundedBorder)
            SecureField("Password", text: $password)
                            .padding()
                            .cornerRadius(5.0)
                            .padding(.bottom, 20)
                            .textFieldStyle(.roundedBorder)
           
            NavigationLink(destination: SecondView(), tag: 1, selection: $selection
                           
            
            ) {
                Button(action: {
                    print("login tapped")
                    self.selection = 1
                })
                {
                   LoginButtonContent()
                }
            }
                           
        }
        .padding()
        .navigationBarTitle("")
        .navigationBarHidden(true)
        

        }
        }  .navigationBarTitle("")
            .navigationBarHidden(true)

  }
}



struct DetailView: View {
    var body: some View {
            Text("user name")
        }
}

struct SecondView: View {
    @ObservedObject var data = ReadData()
    var body: some View {
        List(data.users){ user in
                        
                        NavigationLink(destination:
                                        DetailView() .navigationTitle(user.name)) {
                                VStack(alignment: .leading) {
                                    Text(user.name)
                                        .font(.title)
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color.black)

                                   HStack{
                                       Image(systemName: user.avatar)
                                           .scaledToFill()
                                           .clipShape(Circle())
                                                           .overlay(
                                                            Circle().stroke(Color.purple, lineWidth: 1.5)
                                                           )
                                                           .shadow(radius: 10)
                                       VStack {

                                           Text(user.createdAt)
                                               .font(.title3)
                                               .foregroundColor(Color.purple)
                                       }
                                   }
                                }
                              }
            }
            .navigationBarTitle(Text("Menu")) .navigationBarHidden(false)
        }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}


//
//  Home.swift
//  FitSync
//
//  Created by Sai Gurrapu on 1/16/21.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Image("Home").resizable().aspectRatio(contentMode: .fit).frame(width: 415,height:900)

                    Button(action: {


                    }) {
                        NavigationLink(destination: chooseWorkout()) {
                            HStack(alignment: .center) {
                                Spacer()
                                Text("").foregroundColor(Color.white).bold()
                                Spacer()
                            }
                        }

                    }.padding().cornerRadius(20.0).padding(.top, -210).buttonStyle(PlainButtonStyle())
                }
            }//ZStack
            .edgesIgnoringSafeArea(.all) .navigationBarBackButtonHidden(true)
        }//Nav. View
    }
}

func chooseWorkout() -> some View {
    ScrollView {
    ZStack{
        VStack{
            Image("Workouts").resizable().aspectRatio(contentMode: .fit).frame(width: 415,height:1400).padding(.top,-70)

            Button(action: {


            }) {
                NavigationLink(destination: ContentView()) {
                    HStack(alignment: .center) {
                        Spacer()
                        Text("").foregroundColor(Color.white).bold()
                        Spacer()
                    }
                }

            }.padding().cornerRadius(20.0).padding(.top, -210).buttonStyle(PlainButtonStyle())
        }
    }//ZStack
    .edgesIgnoringSafeArea(.all).navigationBarTitle("")
    .navigationBarHidden(true)
    }
}



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

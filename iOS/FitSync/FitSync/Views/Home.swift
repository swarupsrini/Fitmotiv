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
            .edgesIgnoringSafeArea(.all).navigationBarTitle("")
            .navigationBarHidden(true)
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
                    NavigationLink(destination: workoutDetails()) {
                        HStack(alignment: .center) {
                            Spacer()
                            Text("").foregroundColor(Color.black).bold()
                            Spacer()
                        }
                        
                    }

                }.padding().cornerRadius(20.0).padding(.top, -870).buttonStyle(PlainButtonStyle())
            }
        }//ZStack
        .edgesIgnoringSafeArea(.all).navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

func workoutDetails() -> some View {
    ZStack{
        VStack{
            Image("Core").resizable().aspectRatio(contentMode: .fit).frame(width: 415,height:900)

            Button(action: {


            }) {
                NavigationLink(destination: InviteFriends()) {
                    HStack(alignment: .center) {
                        Spacer()
                        Text("").foregroundColor(Color.black).bold()
                        Spacer()
                    }
                }

            }.padding().cornerRadius(20.0).padding(.top, -210).buttonStyle(PlainButtonStyle())
        }
    }//ZStack
    .edgesIgnoringSafeArea(.all).navigationBarTitle("")
    .navigationBarHidden(true)
}

func InviteFriends() -> some View {
    ZStack{
        VStack{
            Image("InviteFriends").resizable().aspectRatio(contentMode: .fit).frame(width: 415,height:900)

            Button(action: {


            }) {
                NavigationLink(destination: InviteSent()) {
                    HStack(alignment: .center) {
                        Spacer()
                        Text("").foregroundColor(Color.black).bold()
                        Spacer()
                    }
                }

            }.padding().cornerRadius(20.0).padding(.top, -210).buttonStyle(PlainButtonStyle())
        }
    }//ZStack
    .edgesIgnoringSafeArea(.all).navigationBarTitle("")
    .navigationBarHidden(true)
}

func InviteSent() -> some View {
    ZStack{
        VStack{
            Image("InviteSent").resizable().aspectRatio(contentMode: .fit).frame(width: 415,height:900)

            Button(action: {


            }) {
                NavigationLink(destination: FriendAccepted()) {
                    HStack(alignment: .center) {
                        Spacer()
                        Text("").foregroundColor(Color.black).bold()
                        Spacer()
                    }
                }

            }.padding().cornerRadius(20.0).padding(.top, -210).buttonStyle(PlainButtonStyle())
        }
    }//ZStack
    .edgesIgnoringSafeArea(.all).navigationBarTitle("")
    .navigationBarHidden(true)
}

func FriendAccepted() -> some View {
    ZStack{
        VStack{
            Image("FriendAccepted").resizable().aspectRatio(contentMode: .fit).frame(width: 415,height:900)

            Button(action: {


            }) {
                NavigationLink(destination: Workout(screenType: "Workout")) {
                    HStack(alignment: .center) {
                        Spacer()
                        Text("").foregroundColor(Color.black).bold()
                        Spacer()
                    }
                }

            }.padding().cornerRadius(20.0).padding(.top, -210).buttonStyle(PlainButtonStyle())
        }
    }//ZStack
    .edgesIgnoringSafeArea(.all).navigationBarTitle("")
    .navigationBarHidden(true)
}








struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

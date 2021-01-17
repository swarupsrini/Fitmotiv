//
//  Break.swift
//  FitSync
//
//  Created by Sai Gurrapu on 1/17/21.
//

import SwiftUI

struct Break: View {
    var body: some View {
            ZStack{
                VStack{
                    Image("RestScreen").resizable().aspectRatio(contentMode: .fit).frame(width: 415,height:900)

                    Button(action: {


                    }) {
                        NavigationLink(destination: confettiSummary()) {
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


func confettiSummary() -> some View {
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



struct Break_Previews: PreviewProvider {
    static var previews: some View {
        Break()
    }
}

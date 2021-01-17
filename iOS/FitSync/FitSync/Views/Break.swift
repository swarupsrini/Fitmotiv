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
    }
}

struct Break_Previews: PreviewProvider {
    static var previews: some View {
        Break()
    }
}

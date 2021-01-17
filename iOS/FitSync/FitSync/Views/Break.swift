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
                    Image("Summary").resizable().aspectRatio(contentMode: .fit).frame(width: 415,height:900)

                    Button(action: {


                    }) {
                        NavigationLink(destination: Home()) {
                            HStack(alignment: .center) {
                                Spacer()
                                Text("").foregroundColor(Color.black).bold()
                                Spacer()
                            }
                        }

                    }.padding().cornerRadius(20.0).padding(.top, -460).buttonStyle(PlainButtonStyle())
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

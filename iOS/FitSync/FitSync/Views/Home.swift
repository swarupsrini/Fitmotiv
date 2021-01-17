//
//  Home.swift
//  FitSync
//
//  Created by Sai Gurrapu on 1/16/21.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack{
            VStack{
                Image("home").resizable().aspectRatio(contentMode: .fit).frame(width: 415,height:900)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

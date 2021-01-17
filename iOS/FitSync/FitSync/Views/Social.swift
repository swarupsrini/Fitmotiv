//
//  Social.swift
//  FitSync
//
//  Created by Sai Gurrapu on 1/16/21.
//

import SwiftUI

struct Social: View {
    var body: some View {
        ZStack{
            VStack{
                Image("Social").resizable().aspectRatio(contentMode: .fit).frame(width: 415,height:900)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct Social_Previews: PreviewProvider {
    static var previews: some View {
        Social()
    }
}

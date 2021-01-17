//
//  Analytics.swift
//  FitSync
//
//  Created by Sai Gurrapu on 1/16/21.
//

import SwiftUI

struct Analytics: View {
    var body: some View {
        ZStack{
            VStack{
                Image("Analytics").resizable().aspectRatio(contentMode: .fit).frame(width: 415,height:900)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct Analytics_Previews: PreviewProvider {
    static var previews: some View {
        Analytics()
    }
}

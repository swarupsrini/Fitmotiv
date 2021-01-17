//
//  Settings.swift
//  FitSync
//
//  Created by Sai Gurrapu on 1/16/21.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        ZStack{
            VStack{
                Image("Settings").resizable().aspectRatio(contentMode: .fit).frame(width: 415,height:900)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}

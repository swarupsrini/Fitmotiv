//
//  Workout.swift
//  FitSync
//
//  Created by Sai Gurrapu on 1/16/21.
//

import SwiftUI
import MapKit

struct Workout: View {
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 13.086, longitude: 80.2789), latitudinalMeters: 10000, longitudinalMeters: 10000)
    @State var offset : CGFloat = 0

    var body: some View{

        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {

            //Add View
            Login()
            //                Map(coordinateRegion: $region)
            //                    .ignoresSafeArea(.all, edges: .all)

            /// to read frame height...

            GeometryReader{reader in

                VStack{

                    BottomSheet(offset: $offset, value: (-reader.frame(in: .global).height + 150))
                        .offset(y: reader.frame(in: .global).height - 140)
                        // adding gesture....
                        .offset(y: offset)
                        .gesture(DragGesture().onChanged({ (value) in

                            withAnimation{

                                // checking the direction of scroll....

                                // scrolling upWards....
                                // using startLocation bcz translation will change when we drag up and down....

                                if value.startLocation.y > reader.frame(in: .global).midX{

                                    if value.translation.height < 0 && offset > (-reader.frame(in: .global).height + 150){

                                        offset = value.translation.height
                                    }
                                }

                                if value.startLocation.y < reader.frame(in: .global).midX{

                                    if value.translation.height > 0 && offset < 0{

                                        offset = (-reader.frame(in: .global).height + 150) + value.translation.height
                                    }
                                }
                            }

                        }).onEnded({ (value) in

                            withAnimation{

                                // checking and pulling up the screen...

                                if value.startLocation.y > reader.frame(in: .global).midX{

                                    if -value.translation.height > reader.frame(in: .global).midX{

                                        offset = (-reader.frame(in: .global).height + 150)

                                        return
                                    }

                                    offset = 0
                                }

                                if value.startLocation.y < reader.frame(in: .global).midX{

                                    if value.translation.height < reader.frame(in: .global).midX{

                                        offset = (-reader.frame(in: .global).height + 150)

                                        return
                                    }

                                    offset = 0
                                }
                            }
                        }))
                }
            }
            .ignoresSafeArea(.all, edges: .bottom)
        })
    }
}

struct BottomSheet : View {

    @State var txt = ""
    @Binding var offset : CGFloat
    var value : CGFloat

    var body: some View{

        VStack{

            Capsule()
                .fill(Color.gray.opacity(0.7))
                .frame(width: 50, height: 5)
                .padding(.top)
                .padding(.bottom,5)

            HStack(alignment: .center){

                Text("15 Sit Ups").font(.system(size: 20)).bold()

                Spacer()

                Image(systemName: "pause.circle")
                    .font(.system(size: 49))
                    .foregroundColor(.orange)
                Spacer()

                HStack{
                    Image(systemName: "timer")
                        .font(.system(size: 21))
                        .foregroundColor(.orange)
                Text("00:00").font(.system(size: 20)).bold()
                }


            }
            .padding(.vertical,10)
            .padding(.horizontal)
            // BlurView....
            // FOr Dark Mode Adoption....
            .background(BlurView(style: .systemMaterial))
            .cornerRadius(15)
            .padding()

            ScrollView(.vertical, showsIndicators: false, content: {

                LazyVStack(alignment: .leading, spacing: 15, content: {


                    HStack{
                        Image(systemName: "snow")
                            .font(.system(size: 22))
                        Text("Ready for a Cool Down!").bold()
                    }

                    Divider()
                        .padding(.top,10)

                    HStack{
                        Image(systemName: "gear")
                            .font(.system(size: 22))
                        Text("Settings").bold()
                    }

                    Divider()
                        .padding(.top,10)

                })
                .padding()
                .padding(.leading)
                .padding(.trailing)
                .padding(.top)
            })
        }
        .background(BlurView(style: .systemMaterial))
        .cornerRadius(15)
    }
}

struct BlurView : UIViewRepresentable {

    var style : UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView{

        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))

        return view
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {


    }
}


struct Workout_Previews: PreviewProvider {
    static var previews: some View {
        Workout()
    }
}


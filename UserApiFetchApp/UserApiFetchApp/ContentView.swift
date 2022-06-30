//
//  ContentView.swift
//  UserApiFetchApp
//
//  Created by Stefano  on 29/06/22.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @EnvironmentObject var network: Network
    

    

    @State private var region = MKCoordinateRegion(
        //This state the center of the map
                center: CLLocationCoordinate2D(
                    latitude: 57.708870,
                    longitude: 11.974560),
                span: MKCoordinateSpan(
                    latitudeDelta: 0.03,
                    longitudeDelta: 0.03)
                )
    //this is the markeer coordinates
    let markers = [Marker(location: MapMarker(coordinate: CLLocationCoordinate2D(latitude: 57.708870, longitude: 11.974560), tint: .red))]
    
    var body: some View {
        VStack{
            HStack {
                Text("Users infos and locations")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.cyan)
                    .multilineTextAlignment(.center)
         
            }.padding()
        
            

            HStack {
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 70))
                    .foregroundColor(.cyan)
                
                Image(systemName: "info.circle.fill")
                    .font(.system(size: 70))
                    .foregroundColor(.cyan)
                
                Image(systemName: "location.circle.fill")
                    .font(.system(size: 70))
                    .foregroundColor(.cyan)
                
            }
    
            
            
            ScrollView{
                
                Spacer()
                
            VStack {
                
    
                ForEach(network.users) { user in
                    
                    
                    
                    HStack(alignment:.top) {
                        
                        
                        
                        DisclosureGroup(
                            content: {
                            
                                
                                Group{
//                                HStack {
//                                    Text("Name: \(user.name)")
//                                    Spacer()
//                                }.padding()
                                  
                                
                                HStack {
                                    Text("Phone: \(user.phone)")
                                    Spacer()
                                }.padding()
                                
                                HStack {
                                    Text("Email: \(user.email)")
                                    Spacer()
                                }.padding()
                                
                              
                                Text("Location: Gothenburg")
                                    .font(.title2)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.cyan)
                                    
                                   // Text("City: \(user.address.city)")
                                    
                                    //Text("Latitudine: \(user.address.geo.lat)")
                                    //Text("Longitudine: \(user.address.geo.lng)")
                                    
                                    ZStack{


                                        VStack {
//                                          @Binding  var region = MKCoordinateRegion(
//                                                        center: CLLocationCoordinate2D(
//                                                            latitude: 40.83834587046632,
//                                                            longitude: 14.254053016537693),
//                                                        span: MKCoordinateSpan(
//                                                            latitudeDelta: 0.03,
//                                                            longitudeDelta: 0.03)
//                                                        )

                                            Map(coordinateRegion: $region, showsUserLocation: true,
                                                  annotationItems: markers) { marker in
                                                    marker.location
                                                }
                                                .frame(width: 250, height: 100)
                                        // .background(Color.blue.opacity(0.7))

                                         .cornerRadius(15)
                                         .padding()


                            }
                        }
                                    
                                    
                                    
                                }
                                
                           
                           
                            },
                            label: {
                                Text(user.name)
                                    .foregroundColor(.blue)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(1)
                                    .padding()
                                   
                                
                              //  Spacer()
                                
                            }
    
                        )
                        
                        
                        
    
                   
                    }
                    .frame(width: 300,alignment: .bottom)
                    .padding()
                    .background(Color(#colorLiteral(red: 0.6667672396, green: 0.7527905703, blue: 1, alpha: 0.2662717301)))
                    .cornerRadius(20)
                }
            }
            .padding()
            
        }
        //As soon as the Scrollview is loaded we call the getUsers function
        .onAppear {
                network.getUsers()
        }
        }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
    }
}

//this marker is used as pointer in map
struct Marker: Identifiable {
    let id = UUID()
    var location: MapMarker
}

//
//  HomeView.swift
//  ShareIn
//
//  Created by IAAA Technologies on 06/11/22.
//

import SwiftUI

struct HomeView: View {
    let heignt = UIScreen.main.bounds.height / 3
    var body: some View {
        ZStack{
            VStack{
                ZStack(alignment:.trailing){
                    CurevwdView()
                        .fill(.red)
                        .frame(height:50)
                    VStack(alignment: .trailing){
                        HStack(alignment:.center,spacing: 20){
                            NavigationLink {
                                Text("Clock")
                            } label: {
                                Image(systemName: "clock")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                
                            }
                            
                            NavigationLink {
                                Text("Settings")
                            } label: {
                                Image(systemName: "gearshape.fill")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                            }
                            
                            
                        }
                        
                        .padding()
                    }
                }
                Spacer()
                
                HStack(alignment:.center, spacing: 20){
                    VStack{
                        NavigationLink(destination: SendView()) {
                            Rectangle()
                                .fill(.red)
                                .frame(height: heignt / 1.8)
                                .cornerRadius(10)
                                .overlay {
                                    Image(systemName: "paperplane")
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width: 70, height: 70, alignment: .center)
                                }
                        }
                        
                    }
                    VStack{
                        NavigationLink(destination: Text("222")) {
                            Rectangle()
                                .fill(.red)
                                .frame(height: heignt / 1.8)
                                .cornerRadius(10)
                                .overlay {
                                    Image(systemName: "arrow.down.to.line")
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width: 70, height: 70, alignment: .center)
                                }
                        }
                    }
                    
                }.padding()
                HStack{
                    Rectangle()
                        .fill(.red)
                        .frame(height: 5)
                    HStack(alignment: .center, spacing: 0){
                        Button {
                            print("Tapping : Invite button.......")
                        } label: {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 15,height: 15)
                            
                            Text("Invite")
                        }
                    }.frame(width: 100,height: 30)
                    //.padding(.horizontal, 50)
                        .background(.red)
                        .cornerRadius(30)
                    
                    Rectangle()
                        .fill(.red)
                        .frame(height: 10)
                }.padding()
                
            }.navigationBarHidden(true)
        }
        //.ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}



struct CurevwdView : Shape{
    
    func path(in rect:CGRect) -> Path{
        Path { path in
            
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(center: CGPoint(x: rect.midX , y: rect.midY - 100), radius: rect.height / 0.2, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360), clockwise: false)
            
        }
    }
}

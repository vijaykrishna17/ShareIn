//
//  SendView.swift
//  ShareIn
//
//  Created by IAAA Technologies on 07/11/22.
//

import SwiftUI

struct SendView: View {
    @Environment(\.presentationMode) var isPresentation
    @State var current : String = "PHOTOS"
    @Namespace var animated
    var body: some View {
        VStack{
            HStack{
                Button {
                    self.isPresentation.wrappedValue.dismiss()
                    print("Button tapped")
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.headline)
                        .frame(width: 70, alignment: .leading)
                }
                Text("Selected files").padding(.leading, 20)
                    .foregroundColor(.black)
                    .font(.headline)
                Spacer()
            }.padding()
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing: 20){
                    CustomTopBarView(current: $current, name: "APPS", animated: animated)
                    CustomTopBarView(current: $current, name: "PHOTOS", animated: animated)
                    CustomTopBarView(current: $current, name: "MUSIC", animated: animated)
                    CustomTopBarView(current: $current, name: "VIDEOS", animated: animated)
                    CustomTopBarView(current: $current, name: "STORAGE", animated: animated)
                }
                .padding(.horizontal)
            }
            
            ZStack{
                AppsView().opacity(current == "APPS" ? 1 : 0)
                ImageView().opacity(current == "PHOTOS" ? 1 : 0)
                Music().opacity(current == "MUSIC" ? 1 : 0)
                Videos().opacity(current == "VIDEOS" ? 1 : 0)
                Storage().opacity(current == "Storage" ? 1 : 0)
            }
        }.navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        BottomSendView()
    }
    
}

struct SendView_Previews: PreviewProvider {
    static var previews: some View {
        SendView()
    }
}

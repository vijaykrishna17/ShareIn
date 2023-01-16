//
//  BottomSendView.swift
//  ShareIn
//
//  Created by IAAA Technologies on 23/11/22.
//

import SwiftUI

struct BottomSendView: View {
    
  //  @Binding var  selectedItemsNumber : Int
    
    var body: some View {
        ZStack(alignment: .top){
           
            HStack(spacing: 20){
                Spacer()
                ZStack(alignment: .topTrailing){
        
                Image(systemName: "folder.fill")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .leading)
                    .foregroundColor(.blue)
                  //  Spacer()
                Text("\(0)")
                    .foregroundColor(.white)
                    .font(.caption2)
                    .fontWeight(.bold)
                }
                Spacer()
                Button {
                    
                } label: {
                    Text("SEND")
                        .foregroundColor(.white)
                }
                .frame(height: 30)
                .padding(.horizontal, 30)
                .background(Color.blue)
                .cornerRadius(10)
                Spacer()
            }.frame(height: 70)
           
        }.background(Color.orange)
    }
}

//struct BottomSendView_Previews: PreviewProvider {
//    static var previews: some View {
//       // BottomSendView()
//    }
//}

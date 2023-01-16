//
//  CustomTopBarView.swift
//  ShareIn
//
//  Created by IAAA Technologies on 07/11/22.
//

import SwiftUI

struct CustomTopBarView: View {
    @Binding var current: String
    var name : String
    var animated : Namespace.ID
    
    var body: some View {
        Button {
            withAnimation {
                current = name
            }
            
        } label: {
            VStack(spacing: 2){
                Text(name)
                    .foregroundColor(current == name ? Color.black : Color.gray)
                    .font(.headline)
                    .frame(height: 30)
                    .multilineTextAlignment(.leading)
                ZStack{
                    Rectangle()
                        .fill(.clear)
                        .frame(height: 4)
                    if current == name {
                        Rectangle()
                            .frame(height: 4)
                            .matchedGeometryEffect(id: "TAB", in: animated)
                    }
                }
            }
        }
    }
}

struct CustomTopBarView_Previews: PreviewProvider {
    @State static var name : String = "n"
    @Namespace static var animation
    static var previews: some View {
        CustomTopBarView(current: $name,name:  "",animated: animation)
    }
}

//
//  AppsView.swift
//  ShareIn
//
//  Created by IAAA Technologies on 07/11/22.
//

import SwiftUI

struct AppsView: View {
    var body: some View {
        ZStack{
            VStack{
                ScrollView(){
                    Text("VIJAY")
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct AppsView_Previews: PreviewProvider {
    static var previews: some View {
        AppsView()
    }
}


struct Music: View {
    var body: some View {
        ZStack{
            VStack{
                ScrollView(){
                    Text("Music")
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct Videos: View {
    var body: some View {
        ZStack{
            VStack{
                ScrollView(){
                    Text("Video")
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct Images: View {
    var body: some View {
        ZStack{
            VStack{
                ScrollView(){
                    Text("Images")
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct Storage: View {
    var body: some View {
        ZStack{
            VStack{
                ScrollView(){
                    Text("Storage")
                        .foregroundColor(.red)
                }
            }
        }
    }
}

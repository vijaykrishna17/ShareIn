//
//  ImageView.swift
//  ShareIn
//
//  Created by IAAA Technologies on 07/11/22.
//

import SwiftUI
import Photos

struct ImageView: View {
    
    @ObservedObject var photos = ImageViewModal()
    @State private var addedImages = [UIImage?]()
    @State var isSelected : Bool = false
    @State var isEditing : Bool = false
    @State var isStored = Set<UIImage>()
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    var body: some View {
        ZStack(alignment: .bottom){
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20){
                ForEach(0..<photos.allPhotos.count,id:\.self){ index in
                    ZStack(alignment:.topTrailing){
                    VStack(alignment:.leading){
                        Image(uiImage: photos.allPhotos[index])
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                        Text(photos.imageNames[index])
                            .font(.caption2)
                    }
                        ZStack(){
                            if isStored.contains(photos.allPhotos[index]){
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .foregroundColor(.red)
                                    .frame(width: 10, height: 10, alignment: .trailing)
                            }else{
                                Image(systemName: "heart")
                                    .resizable()
                                    .foregroundColor(.red)
                                    .frame(width: 10, height: 10, alignment: .trailing)
                            }
                           
                        }.padding()
                    }
                    .onTapGesture {
                      //  addedImages.append(photo)
                       // print(photos.imageNames[index])
                       // print(addedImages)
                       // isEditing.toggle()
                        if isStored.contains(photos.allPhotos[index]){
                            isStored.remove(photos.allPhotos[index])
                        }else{
                            isStored.insert(photos.allPhotos[index])
                        }
                        print(isStored)
                        
                       // isSelected.toggle()
                    }
                }
                
            }
        }
           // BottomSendView()
               // .background(Color.red)
               // .padding(.bottom, 30)
        }
        .alert(isPresented: .constant(self.photos.errorString != "") ) {
            Alert(title: Text("Error"), message: Text(self.photos.errorString ), dismissButton: Alert.Button.default(Text("OK")))
        }
    }
    
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}

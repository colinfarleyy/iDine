//
//  ItemDetail.swift
//  iDine
//
//  Created by Student on 9/2/21.
//

import SwiftUI


struct ItemDetail: View {
    @EnvironmentObject var favorite: Favorites
    @EnvironmentObject var order : Order
    @State private var showOrderToast = false
    @State private var showFavoritesToast = false
    let item : MenuItem
    var body: some View {
        VStack {
        ZStack (alignment: .bottomTrailing) {
            Image(item.mainImage)
                .resizable()
                .scaledToFit()
            Text("Photo: \(item.photoCredit)")
                .background(Color.black)
                .padding(4)
                .font(.caption)
                .foregroundColor(.white)
                .offset(x: -5, y: -5)
        }
            Text(item.description)
                .padding()
            Button("Order This") {
                order.add(item: item)
            }
            .padding()
            .background(Color(red: 0, green: 1, blue: 0))
            .clipShape(Capsule())
        Button(action: {
            favorite.add(item: item)
            showFavoritesToast.toggle()
        })
        {
            Text("Favorite Item")
                .padding()
                .background(Color("lightYellow"))
                .cornerRadius(100)
                .clipShape(Capsule())
        }
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(Order())
        }
    }
}

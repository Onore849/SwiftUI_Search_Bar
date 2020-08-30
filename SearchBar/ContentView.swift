//
//  ContentView.swift
//  SearchBar
//
//  Created by 野澤拓己 on 2020/08/31.
//  Copyright © 2020 Takumi Nozawa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var datas = ["hello", "Hi", "Welcome", "World", "asdasd", "uhuhu"]
    @State var txt = ""
    
    var body: some View {
        
        VStack {
            
            searchView(txt: $txt)
            
            List(datas.filter{ txt == "" ? true:  $0.localizedCaseInsensitiveContains(txt)}, id: \.self ){ i in
                
                Text(i).fontWeight(.heavy)
            }
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct searchView: UIViewRepresentable {
    
    @Binding var txt: String
    
    func makeCoordinator() -> Coordinator {
        
        return searchView.Coordinator(parent1: self)
    }
    
    
    func makeUIView(context: UIViewRepresentableContext<searchView>) -> UISearchBar {
        
        let searchbar = UISearchBar()
        searchbar.barStyle = .default
        searchbar.autocapitalizationType = .none
        searchbar.delegate = context.coordinator
        return searchbar
        
    }
    
    func updateUIView(_ uiView: searchView.UIViewType, context: UIViewRepresentableContext<searchView>) {
        
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        var parent: searchView!
        
        init(parent1 : searchView) {
            
            parent = parent1
            
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
            parent.txt = searchText
        }
        
    }
    
}

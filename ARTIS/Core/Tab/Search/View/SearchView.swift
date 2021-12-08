//
//  SearchView.swift
//  SearchView
//
//  Created by 정소윤 on 2021/09/23.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var vm: SearchViewModel = SearchViewModel()
    @State private var isSearching: Bool = false
    
    var body: some View {
        
        VStack{
            
            searchBarView
            
            if isSearching {
                
                recentSearchView
            } else {
                
                newsView
            }
        }
        .navigationTitle("검색하기")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        
        SearchView()
    }
}

extension SearchView {
    
    private var searchBarView: some View {
        
        HStack {
            
            HStack {
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(vm.textSearch.isEmpty ? Color.gray.opacity(0.5) : Color.theme.accent)
                
                TextField("발매 정보, 전시회, 브랜드 검색하기", text: $vm.textSearch)
                    .foregroundColor(Color.theme.accent)
                    .overlay(
                        
                        Image(systemName: "xmark.circle.fill")
                            .padding()
                            .offset(x: 10)
                            .opacity(vm.textSearch.isEmpty ? 0.0 : 1.0)
                            .onTapGesture {
                                
                                self.isSearching = false
                                UIApplication.shared.endEditing()
                                vm.textSearch = ""
                            }
                        
                        ,alignment: .trailing
                    )
            }
            .onTapGesture {
                withAnimation(.spring()) {
                    self.isSearching = true
                }
            }
            .padding()
            .background(
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray.opacity(0.1))
                    .shadow(color: Color.theme.MainColor.opacity(0.2), radius: 10, x: 0, y: 0)
            )
            .padding()
            
            if isSearching {
                
                Text("cancel")
                    .foregroundColor(Color.theme.accent)
                    .transition(.move(edge: .trailing))
                    .onTapGesture {
                        UIApplication.shared.endEditing()
                        self.isSearching = false
                        vm.textSearch = ""
                    }
                    .padding(.trailing,20)
            }
        }
    }
    
    private var newsView: some View {
        
        ScrollView {
            
            LazyVStack {
                
                HStack {
                    
                    Text("트렌드 소식")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                    
                    Spacer()
                }
                
                ForEach(vm.filteredNews) { news in
                    
                    NewsRowView(news: news)
                }
            }
        }
    }
    
    private var recentSearchView: some View {
        
        ScrollView {
            
            HStack {
                
                Text("최근 검색")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                
                Spacer()
            }
        }
    }
}

//
//  SearchView.swift
//  SearchView
//
//  Created by 정소윤 on 2021/09/23.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchText: String
    @ObservedObject var vm: HomeViewModel = HomeViewModel()
    
    var body: some View {
        
        VStack{
            
            searchBarView
            
            newsView
        }
        .navigationTitle("검색하기")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        
        SearchView(searchText: .constant(""))
    }
}

extension SearchView {
    
    private var searchBarView: some View {
        
        HStack {
            
            Image(systemName: "magnifyingglass")
                .foregroundColor(searchText.isEmpty ? Color.gray.opacity(0.5) : Color.theme.accent)
            
            TextField("발매 정보, 전시회, 브랜드 검색하기", text: $searchText)
                .foregroundColor(Color("myColor"))
                .overlay(
                    
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                    
                    ,alignment: .trailing
                )
        }
        .padding()
        .background(
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.gray.opacity(0.1))
                .shadow(color: Color.theme.MainColor.opacity(0.2), radius: 10, x: 0, y: 0)
        )
        .padding()
    }
    
    private var keywordView: some View {
        
        VStack(alignment: .leading) {
            
            HStack() {
                
                Text("트렌드 키워드 🔥")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            
            ForEach(vm.all_news) { news in
                    
                Text(news.title)
                    .font(.footnote)
                    .fontWeight(.bold)
                
                Divider()
            }
        }.padding(.horizontal)
        .padding(.bottom, 30)
    }
    
    private var newsView: some View {
        
        ScrollView {
            
            VStack {
                
                HStack() {
                    
                    Text("트렌드 소식")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding()
                    
                    Spacer()
                }
                
                ForEach(vm.all_news) { news in
                    
                    LatestNewsView(news: news)
                }
            }
        }
    }
}

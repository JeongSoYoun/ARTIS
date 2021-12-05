//
//  SearchView.swift
//  SearchView
//
//  Created by 정소윤 on 2021/09/23.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchView: String = ""
    @State var isHide: Bool = false
    @ObservedObject var vm: HomeViewModel = HomeViewModel()
    
    var body: some View {
        
        VStack{
            
            searchBarView
            
            ScrollView {
                
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
            
            ZStack {
                
                Rectangle()
                    .frame(width:UIScreen.main.bounds.width - 30, height: 50)
                    .cornerRadius(10)
                    .foregroundColor(Color.gray.opacity(0.2))
                
                HStack {
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.gray.opacity(0.5))
                    
                    TextField("발매 정보, 전시회, 브랜드 검색하기", text: $searchView)
                        .foregroundColor(Color("myColor"))
                }.padding()
                
            }
            .padding(.horizontal)
        }.padding()
        .padding(.top,20)
    }
    
    private var keywordView: some View {
        
        VStack(alignment: .leading) {
            
            HStack() {
                
                Text("트렌드 키워드 🔥")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .padding(.bottom,20)
            
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
        
        VStack {
            
            HStack() {
                
                Text("트렌드 소식")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                
                Spacer()
            }
            .padding(.bottom,20)
            .padding(.horizontal)
            
            ForEach(vm.all_news) { news in
                
                LatestNewsView(news: news)
            }
        }
    }
}

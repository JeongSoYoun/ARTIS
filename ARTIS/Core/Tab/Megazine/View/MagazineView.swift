
import SwiftUI

struct MagazineView: View {
    
    @ObservedObject var vm: MagazineViewModel = MagazineViewModel()
    @State private var isMoreViewShow: Bool = false
    
    var body: some View {
        
        ScrollView {
            
            Spacer()
            
            headerView
            
            magazineView
            
            Spacer()
        }
    }
}

struct MegazineView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        MagazineView()
    }
}

extension MagazineView {
    
    private var headerView: some View {
        
        Text("패션, 음악, 아트 등 여러 장르의 문화를 조금 더 심도있고 재밌는 컨텐츠로 제공하고자 만든 페이지입니다.")
            .font(.subheadline)
            .fontWeight(.bold)
            .foregroundColor(Color.theme.TextColor)
            .multilineTextAlignment(.center)
            .padding()
    }
    
    @ViewBuilder
    private var magazineView: some View {
        
        if !vm.magazines.isEmpty {
            
            VStack(alignment: .leading) {
                
                VStack(alignment: .trailing) {
                    
                    Text("더 보기")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.theme.TextColor)
                        .padding(.horizontal)
                        .padding(.bottom,5)
                        .onTapGesture {
                            isMoreViewShow.toggle()
                            // show more megazine view. Need to handle
                        }
                    
                    CustomCarouselSnapView(media: vm.magazines, spacing: 5, widthOfHiddenCard: 20, leftPadding: 15, showsIndicators: false, showsTitle: false)
                }
                .padding(.top,20)
                
                Text("최근에 본 항목")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.theme.TextColor)
                    .padding()
            }
        }
    }
}

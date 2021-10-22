
import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var all_news: [News] = [
        
        News(image_name: "peace", title: "피스마이너스원 에어포스 1", subject: "발매 정보"),
        News(image_name: "offwhite", title: "오프화이트 조던 1", subject: "발매 정보"),
        News(image_name: "sacai", title: "사카이 나이키", subject: "발매 정보"),
        News(image_name: "travis", title: "트레비스 스캇 프라그먼트", subject: "발매 정보"),
        News(image_name: "sup", title: "슈프림 21 FW 룩북", subject: "브랜드"),
        News(image_name: "raf", title: "라프시몬스 프라다", subject: "브랜드"),
        News(image_name: "palace", title: "팔라스 스케이트보드 21FW 룩북", subject: "브랜드"),
        News(image_name: "donda", title: "돈다 카니예 웨스트 투어 머크", subject: "브랜드"),
        News(image_name: "yoshigo", title: "요시고 전시회", subject: "전시회"),
        News(image_name: "picasso", title: "피카소 전시회", subject: "전시회"),
        News(image_name: "lab", title: "랩 전시회", subject: "전시회"),
        News(image_name: "beyond", title: "비욘드 전시회", subject: "전시회")
    ]
    
    init() {}
    
    func viewList(menu: String) -> ([AnyView],[String]) {
        
        return AnyViewReturn(vm: all_news, menu: menu)
    }
    
    private func AnyViewReturn(vm: [News], menu: String) -> ([AnyView],[String]) {
        
        var anyviewList: [AnyView] = []
        var titleList: [String] = []
        
        for index in (0 ..< vm.count) {
            
            if vm[index].subject == menu {
                
                anyviewList.append(AnyView(Image(vm[index].image_name).resizable()))
                titleList.append(vm[index].title)
            }
        }
        
        return (anyviewList,titleList)
    }
}

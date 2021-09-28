
import Foundation
import SwiftUI

class CarouselViewModel: ObservableObject {
    
    @Published var sneakersVM: [NewsModel] = [
        
        NewsModel(image_name: "peace", title: "피스마이너스원 에어포스 1"),
        NewsModel(image_name: "offwhite", title: "오프화이트 조던 1"),
        NewsModel(image_name: "sacai", title: "사카이 나이키"),
        NewsModel(image_name: "travis", title: "트레비스 스캇 프라그먼트")
    ]
    @Published var exhibitionVM: [NewsModel] = [
        
        NewsModel(image_name: "yoshigo", title: "요시고 전시회"),
        NewsModel(image_name: "picasso", title: "피카소 전시회"),
        NewsModel(image_name: "lab", title: "랩 전시회"),
        NewsModel(image_name: "beyond", title: "비욘드 전시회")
    
    ]
    @Published var brandVM: [NewsModel] = [
        
        NewsModel(image_name: "sup", title: "슈프림 21 FW 룩북"),
        NewsModel(image_name: "raf", title: "라프시몬스 프라다"),
        NewsModel(image_name: "palace", title: "팔라스 스케이트보드 21FW 룩북"),
        NewsModel(image_name: "donda", title: "돈다 카니예 웨스트 투어 머크")
    ]
    
    init() {}
    
    func viewList(menu: String) -> ([AnyView],[String]) {
        
        switch menu {
            
        case "sneakers":
            
            return AnyViewReturn(vm: sneakersVM)
            
        case "exhibition":
            
            return AnyViewReturn(vm: exhibitionVM)
            
        default:
            
            return AnyViewReturn(vm: brandVM)
        }
    }
    
    private func AnyViewReturn(vm: [NewsModel]) -> ([AnyView],[String]) {
        
        var anyviewList: [AnyView] = []
        var titleList: [String] = []
        
        for index in (0 ..< vm.count) {
            
            anyviewList.append(AnyView(Image(vm[index].image_name).resizable())
            )
            
            titleList.append(vm[index].title)
        }
        
        return (anyviewList,titleList)
    }
}

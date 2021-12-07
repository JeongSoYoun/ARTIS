//
//  Tappable.swift
//  ARTIS
//
//  Created by 정소윤 on 2021/12/07.
//

import Foundation
import SwiftUI

struct TappableView: UIViewRepresentable {
    
    var tapCallback: (UITapGestureRecognizer) -> Void

    typealias UIViewType = UIView

    func makeCoordinator() -> TappableView.Coordinator
    {
        Coordinator(tapCallback: self.tapCallback)
    }

    func makeUIView(context: UIViewRepresentableContext<TappableView>) -> UIView
    {
        let view = UIView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap(sender:))))
        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<TappableView>)
    {
    }

    class Coordinator
    {
        var tapCallback: (UITapGestureRecognizer) -> Void

        init(tapCallback: @escaping (UITapGestureRecognizer) -> Void)
        {
            self.tapCallback = tapCallback
        }

        @objc func handleTap(sender: UITapGestureRecognizer)
        {
            self.tapCallback(sender)
        }
    }
}

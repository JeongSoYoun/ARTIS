//
//  ScreenBound.swift
//  ScreenBound
//
//  Created by 정소윤 on 2021/09/23.
//

import Foundation
import SwiftUI

extension View {
    
    func getScreenBound() -> CGRect {
        
        return UIScreen.main.bounds
    }
}

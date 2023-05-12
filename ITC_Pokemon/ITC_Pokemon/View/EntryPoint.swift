//
//  EntryPoint.swift
//  ITC_Pokemon
//
//  Created by Taijaun Pitt on 12/05/2023.
//

import SwiftUI

struct EntryPoint: View {
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.navigationPath){
            coordinator.getMyPage(page: .mainPage)
            .navigationDestination(for: MyPage.self) { navigation in
                coordinator.getMyPage(page: navigation)
            }
        }
    }
}

struct EntryPoint_Previews: PreviewProvider {
    static var previews: some View {
        EntryPoint().environmentObject(Coordinator())
    }
}

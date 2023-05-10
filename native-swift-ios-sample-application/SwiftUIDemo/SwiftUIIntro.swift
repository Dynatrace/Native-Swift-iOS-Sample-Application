//
//  SwiftUIIntro.swift
//  native-swift-ios-sample-application
//
//  Created by Sabry, Ahmad on 26.03.23.
//

import SwiftUI
import WebKit
struct SwiftUIIntro: View {

    var body: some View {

        WebView(url: URL(string: "https://www.dynatrace.com/support/help/shortlink/swiftui-instrumentation#install-instrumentor")!)
        NavigationLink {
            // destination view to navigation to
            suiAutoInstrumentedControls()
        } label: {
            Label("Start!", systemImage: "swift")
        } 
    }
}

struct SwiftUIIntro_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIIntro()
    }
}

class SwiftUIIntroVHC: UIHostingController<SwiftUIIntro>{
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder, rootView: SwiftUIIntro())
    }
}

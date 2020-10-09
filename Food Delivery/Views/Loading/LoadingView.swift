//
//  LoadingView.swift
//  Food Delivery
//
//  Created by Ilya Senchukov on 09.10.2020.
//

import SwiftUI

enum LoadingState {
    case loading
    case cancel
    case done
}

struct LoadingView<Content:View>: View {
    var state: LoadingState
    var content: () -> Content

    init(state: LoadingState, @ViewBuilder content: @escaping () -> Content) {
        self.state = state
        self.content = content
    }
    
    var body: some View {
        if state == .loading {
            ProgressView()
        } else if state == .cancel {
            Text("Cancel")
        } else if state == .done {
            content()
        } else {
            Text("not found")
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(state: .done) {
            Text("Done")
        }
    }
}

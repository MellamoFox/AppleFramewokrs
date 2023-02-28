//
//  FrameWorkGridView.swift
//  AppleFramewokrs
//
//  Created by MellamoFox on 27.02.2023.
//

import SwiftUI

struct FrameWorkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
   
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(MockData.frameworks) { framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                    }
            }
            }
            .navigationTitle("Frameworks")
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                    FrameworkDetailView(framework:
                                            viewModel.selectedFramework
                                        ?? MockData.sampleFramework, isShowingDetailView: $viewModel.isShowingDetailView	)
                }
        }
    }
}

struct FrameWorkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameWorkGridView()
    }
}




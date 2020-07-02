//
//  ContentView.swift
//  CoreImageSepiaTone
//
//  Created by Pradeep on 02/07/20.
//  Copyright © 2020 Pradeep. All rights reserved.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins


struct ContentView: View {
    
    @State private var image: Image?
    
    var body: some View {
        VStack{
            image?
            .resizable()
            .scaledToFit()
        }
    .onAppear(perform: loadImage)
    }
    func loadImage()  {
        guard let inputImage = UIImage(named: "img") else {
            return
        }
        let beginImage = CIImage(image: inputImage)
        let context = CIContext()
        let currentFilter = CIFilter.sepiaTone()
        currentFilter.inputImage = beginImage
        currentFilter.intensity = 1
        
        //get a CIImage
        guard let outputImage = currentFilter.outputImage else {
            return
        }
        // get CGImage
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            // convert that to a UIImage
            let uiImage = UIImage(cgImage: cgimg)

            // and convert that to a SwiftUI image
            image = Image(uiImage: uiImage)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

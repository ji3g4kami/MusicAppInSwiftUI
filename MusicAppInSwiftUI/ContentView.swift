//
//  ContentView.swift
//  MusicAppInSwiftUI
//
//  Created by 登秝吳 on 04/07/2020.
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    @State var isPlaying = false
    
    @State var audioPlayer: AVAudioPlayer = {
        let songUrl = Bundle.main.url(forResource: "ShapeOfYou", withExtension: "m4a")!
        return try! AVAudioPlayer(contentsOf: songUrl)
    }()
    
    var body: some View {
        ZStack {
            Color.bgColor
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Music Player")
                        .font(.system(size: 45))
                        .fontWeight(.bold)
                        .foregroundColor(.btnColor)
                }
                HStack {
                    if isPlaying {
                        Button(action: {
                            audioPlayer.pause()
                            isPlaying.toggle()
                        }, label: {
                            Image(systemName: "pause.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .aspectRatio(contentMode: .fill)
                                .foregroundColor(.btnColor)
                        })
                    } else {
                        Button(action: {
                            audioPlayer.play()
                            isPlaying.toggle()
                        }, label: {
                            Image(systemName: "play.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .aspectRatio(contentMode: .fill)
                                .foregroundColor(.btnColor)
                        })
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
}

extension Color {
    static func rgb(r: Double, g: Double, b: Double) -> Color {
        return Color(red: r / 255, green: g / 255, blue: b / 255)
    }
    static let bgColor = Color.rgb(r: 21, g: 22, b: 33)
    static let btnColor = Color.rgb(r: 15, g: 175, b: 220)
}

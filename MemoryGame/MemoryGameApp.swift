//
//  MemoryGameApp.swift
//  MemoryGame
//
//  Created by Leandro on 10/06/2024.
//

import SwiftUI

@main
struct MemoryGameApp: App {
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}

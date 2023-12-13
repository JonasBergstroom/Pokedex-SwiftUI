//
//  Pokedex_SwiftUITests.swift
//  Pokedex-SwiftUITests
//
//  Created by Jonas Bergström on 2023-12-13.

import XCTest
import SnapshotTesting
import SwiftUI
@testable import Pokedex_SwiftUI // Replace with your actual app name

class PokedexSwiftUITests: XCTestCase {
    func testContentViewSnapshot() {
        let contentView = ContentView()
        let hostingController = UIHostingController(rootView: contentView)
        
        assertSnapshot(
            matching: hostingController,
            as: .image(on: .iPhone8)
        )
    }
}

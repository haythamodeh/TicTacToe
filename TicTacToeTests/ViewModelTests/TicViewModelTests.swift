//
//  TicViewModelTests.swift
//  TicTacToeTests
//
//  Created by Haytham Odeh on 5/13/23.
//

import XCTest
@testable import TicTacToe

class TicViewModelTests: XCTestCase {

    func test_initialValue_NineCells() {
        // Arrange
        let ticViewModel = TicViewModel()
        // Act
        
        // Assert
        XCTAssertEqual(ticViewModel.grid.count, 9)
    }

    func test_initialValue_IsBlank() {
        // Arrange
        let ticViewModel = TicViewModel()
        
        // Act
        
        // Assert
        XCTAssertEqual((ticViewModel.grid.filter { $0 == cell.x }.count), 9)
    }
}

//
//  TicViewModelTests.swift
//  TicTacToeTests
//
//  Created by Haytham Odeh on 5/13/23.
//

@testable import TicTacToe
import XCTest

class TicViewModelTests: XCTestCase {
    func test_initialValue_nineCells() {
        // Arrange
        let ticViewModel = TicViewModel()
        // Act

        // Assert
        XCTAssertEqual(ticViewModel.grid.count, 9)
    }

    func test_initialValue_isBlank() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act

        // Assert
        XCTAssertEqual((ticViewModel.grid.filter { $0 == Cell.b }.count), 9)
    }

    func test_initialValue_noWinner() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act

        // Assert
        XCTAssertEqual(Winner.none, ticViewModel.winner)
    }

    func test_draw_noWinner() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act
        let fullGrid: [Cell] = [.o, .x, .o,
                                .x, .o, .x,
                                .x, .o, .x]
        for (n, c) in zip(0..<9, fullGrid) {
            ticViewModel.setCell(index: n, cellValue: c)
        }

        // Assert
        XCTAssertTrue(ticViewModel.isGameOver)
        XCTAssertEqual(Winner.none, ticViewModel.winner)
    }

    func test_fullFrid_xWinner() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act
        let fullGrid: [Cell] = [.x, .o, .x,
                                .o, .x, .o,
                                .x, .o, .x]
        for (n, c) in zip(0..<9, fullGrid) {
            ticViewModel.setCell(index: n, cellValue: c)
        }

        // Assert
        XCTAssertTrue(ticViewModel.isGameOver)
        XCTAssertEqual(Winner.x, ticViewModel.winner)
    }

    func test_winNotFull_oWinner() {
        // Arrange
        let ticViewModel = TicViewModel()

        // Act
        ticViewModel.setCell(index: 0, cellValue: .o)
        ticViewModel.setCell(index: 1, cellValue: .o)
        ticViewModel.setCell(index: 2, cellValue: .o)

        // Assert
        XCTAssertTrue(ticViewModel.isGameOver)
        XCTAssertEqual(Winner.o, ticViewModel.winner)
    }
}

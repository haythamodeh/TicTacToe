//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Created by Haytham Odeh on 5/13/23.
//

@testable import TicTacToe
import XCTest

final class TicTacToeTests: XCTestCase {
    
    func test_initialValue_NineCells() {
        // Arrange
        let ticModel = TicModel()

        // Act

        // Assert
        XCTAssertEqual(ticModel.grid.count, 9)
    }

    func test_setCell3_IsX() {
        // Arrange
        var ticModel = TicModel()

        // Act
        ticModel.setCell(n: 3, c: .x)

        // Assert
        XCTAssertTrue(ticModel.grid[3] == cell.x)
    }

    func test_setCell42_IsIgnored() {
        // Arrange
        var ticModel = TicModel()

        // Act
        ticModel.setCell(n: 42, c: .x)

        // Assert
        XCTAssertTrue(ticModel.grid.contains { $0 == cell.x })
    }

    func test_setCellTwice_ignoreSecond() {
        // Arrange
        var ticModel = TicModel()

        // Act
        ticModel.setCell(n: 3, c: .x)
        ticModel.setCell(n: 3, c: .o)

        // Assert
        XCTAssertTrue(ticModel.grid[3] == cell.x)
        XCTAssertEqual((ticModel.grid.filter { $0 == cell.x }.count), 1)
        XCTAssertEqual((ticModel.grid.filter { $0 == cell.b }.count), 8)
    }

    func test_setCellBlank_ignored() {
        // Arrange
        var ticModel = TicModel()

        // Act
        ticModel.setCell(n: 3, c: .x)
        ticModel.setCell(n: 3, c: .b)

        // Assert
        XCTAssertTrue(ticModel.grid[3] == cell.x)
        XCTAssertEqual((ticModel.grid.filter { $0 == cell.x }.count), 1)
        XCTAssertEqual((ticModel.grid.filter { $0 == cell.b }.count), 8)
    }
}

//
//  TicViewModel.swift
//  TicTacToe
//
//  Created by Haytham Odeh on 5/13/23.
//

import Foundation

class TicViewModel: ObservableObject {
    @Published private var ticModel: TicModel

    init() {
        ticModel = TicModel()
    }

    var grid: [Cell] { ticModel.grid }

    var winner: Winner { ticModel.winner }

    var isGameOver: Bool {
        ticModel.isGridFull || (ticModel.winner != .none)
    }

    func setCell(index: Int, cellValue: Cell) {
        ticModel.setCell(n: index, c: cellValue)

        _ = ticModel.updateGameStatus()
    }
}

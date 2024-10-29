//
//  PiecesModel.swift
//  Fischr
//
//  Created by Quang Minh Nguyen on 29/10/2024.
//

import Foundation

struct PiecesModel: Identifiable {
    var id: String
    var imageName: String
    var point: CGPoint = .zero
    
    static var files = ["a", "b", "c", "d", "e", "f", "g", "h"]
    static var ranks = ["8", "7", "6", "5", "4", "3", "2", "1"]
    static let pieceIds = ["R1", "R2", "N1", "N2", "B1", "B2", "Q1", "K1"]
    
    static func indexOfPieceId(_ pieceId: String, in recodedPosition: String) -> Int {
        return (recodedPosition.indexDistance(of: pieceId) ?? 0) / 2
    }
    
    static let blackRow: [PiecesModel] = [
        PiecesModel(id: "R1", imageName: "br"),
        PiecesModel(id: "R2", imageName: "br"),
        PiecesModel(id: "N1", imageName: "bn"),
        PiecesModel(id: "N2", imageName: "bn"),
        PiecesModel(id: "B1", imageName: "bb"),
        PiecesModel(id: "B2", imageName: "bb"),
        PiecesModel(id: "Q1", imageName: "bq"),
        PiecesModel(id: "K1", imageName: "bk"),
    ]
    
    static let whiteRow: [PiecesModel] = [
        PiecesModel(id: "R1", imageName: "wr"),
        PiecesModel(id: "R2", imageName: "wr"),
        PiecesModel(id: "N1", imageName: "wn"),
        PiecesModel(id: "N2", imageName: "wn"),
        PiecesModel(id: "B1", imageName: "wb"),
        PiecesModel(id: "B2", imageName: "wb"),
        PiecesModel(id: "Q1", imageName: "wq"),
        PiecesModel(id: "K1", imageName: "wk"),
    ]
    
    // recode a position with indexes of occurences of the same piece from left to right, eg: BBQNNRKR -> B1B2Q1N1N2R1K1R2
    static func recodedPosition(_ position: String) -> String {
        
        var recoded = ""
        
        var rook = 1
        var knight = 1
        var bishop = 1
        
        for c in position {
            switch c {
            case "R":
                recoded += "R\(rook)"
                rook += 1
            case "N":
                recoded += "N\(knight)"
                knight += 1
            case "B":
                recoded += "B\(bishop)"
                bishop += 1
            default:
                recoded += "\(c)1"
            }
        }
        
        return recoded
    }
}

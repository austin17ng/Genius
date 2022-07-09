//
//  Dom.swift
//  Genius
//
//  Created by Nguyễn Tùng on 08/07/2022.
//

import Foundation

//struct Dom: Decodable{
//    var tag: String?
//    var children: [ChildDom]?
////    var attributes: Attributes?
//
//    struct ChildDom: Decodable {
//        var tag: String?
//        var children: [String]?
//    }
//}

struct Dom: Decodable {
    var tag: String?
    var children: [ChildDom]?
    
    struct ChildDom: Decodable {
        var tag: String?
        var children: [String]
    }
    
}

struct Attributes: Decodable {
    var src: String?
}

//enum QuantumValue: Decodable {
//
//    case dom(Dom), string(String)
//
//    init(from decoder: Decoder) throws {
//        if let dom = try? decoder.singleValueContainer().decode(Dom.self) {
//            self = .dom(dom)
//            return
//        }
//
//        if let string = try? decoder.singleValueContainer().decode(String.self) {
//            self = .string(string)
//            return
//        }
//
//        throw QuantumError.missingValue
//    }
//
//    enum QuantumError:Error {
//        case missingValue
//    }
//}


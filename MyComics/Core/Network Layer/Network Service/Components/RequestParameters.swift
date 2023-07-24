//
//  RequestParameters.swift
//  MyComics
//
//  Created by Антон Сивцов on 09.07.2023.
//

import Foundation

struct RequestParameters {
    let offset: String?
    let limit: String?
    let orderBy: ResultingOrder?
    
    struct ResultingOrder {
        let order: String
        
        init(order: OrderType, by orderBy: OrderType.ByOrder) {
            let descendingPrefix = "-"
            var currentOrder = ""
            switch order {
            case .ascending:
                currentOrder = orderBy.rawValue
            case .descending:
                currentOrder = descendingPrefix + orderBy.rawValue
            }
            self.order = currentOrder
        }
        
        enum OrderType {
            case ascending
            case descending
            
            enum ByOrder: String, Encodable {
                case byName = "name"
                case byModification = "modification"
                
                init(type: OrderType) {
                    switch type {
                    case .ascending:
                        self = .byModification
                    case .descending:
                        self = .byName
                    }
                }
            }
        }
    }
    
    // MARK: - Init
    
    init(offset: Int? = nil, limit: Int? = nil, orderBy: ResultingOrder? = nil) {
        self.offset = offset != nil ? String(offset ?? 0) : nil
        self.limit = offset != nil ? String(limit ?? 0) : nil
        self.orderBy = orderBy
    }
}

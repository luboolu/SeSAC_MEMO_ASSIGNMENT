//
//  Date+Extension.swift
//  SeSAC_MEMO
//
//  Created by 김진영 on 2021/11/09.
//

import Foundation

extension DateFormatter {
    static var customFormat: DateFormatter {
        
        let date = DateFormatter()
        date.dateFormat = "yyyy.MM.dd HH:mm"
        
        return date
    }
}

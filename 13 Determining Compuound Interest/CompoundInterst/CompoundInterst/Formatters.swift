//
//  Formatters.swift
//  CompoundInterst
//
//  Created by 鈴木剛 on 2021/06/24.
//

import Foundation

var nf: NumberFormatter {
    let nf = NumberFormatter()
    nf.numberStyle = .decimal
    return nf
}

var cf: NumberFormatter {
    let cf = NumberFormatter()
    cf.numberStyle = .currency
    return cf
}

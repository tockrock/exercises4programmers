//
//  FormField.swift
//  CompoundInterst
//
//  Created by 鈴木剛 on 2021/06/25.
//

import SwiftUI

struct FormField {
    let label: String
    @State var value
    
}

extension FormField: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FormField_Previews: PreviewProvider {
    static var previews: some View {
        FormField()
    }
}

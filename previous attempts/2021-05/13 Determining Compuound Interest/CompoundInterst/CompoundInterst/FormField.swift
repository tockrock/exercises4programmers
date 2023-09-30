//
//  FormField.swift
//  CompoundInterst
//
//  Created by 鈴木剛 on 2021/06/25.
//

import SwiftUI

struct FormField {
    let label: String
    @StateObject var input: StringInput
    
}

extension FormField: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
            TextField(label, text: $input.input)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.trailing)
        }
        
    }
}

struct FormField_Previews: PreviewProvider {
    static var previews: some View {
        FormField(label: "Label", input: StringInput(decimals: 2))
            .padding()
    }
}

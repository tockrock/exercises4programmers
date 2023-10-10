//
//  PrepView.swift
//  Pizza Party
//
//  Created by 鈴木剛 on 2023/10/08.
//

import SwiftUI
import Observation

@Observable class PrepModel {
    var peopleInput = ""
    var sliceInput = ""
}

extension PrepModel {
    var output: String {
        guard let people = Int(peopleInput),
              let slice = Int(sliceInput),
              people > 0,
              slice > 0 else {
            return "Please enter positive numbers above"
        }
        
        let slicesNeeded = people * slice
        let pizza = (slicesNeeded + 7) / 8
        let leftover = pizza * 8 - slicesNeeded
        
        return """
        \(slice) slices for \(people) people
        You will need \(pizza) pizzas
        There will be \(leftover) leftover pieces.
        """
    }
    
}

struct PrepView: View {
    @Bindable var model = PrepModel()
}

extension PrepView {
    var body: some View {
        VStack {
            TextField("People", text: $model.peopleInput)
            TextField("Slices per person", text: $model.sliceInput)
            Divider()
                .padding(.vertical)
            Text(model.output)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    PrepView()
}

//
//  PartyView.swift
//  Pizza Party
//
//  Created by 鈴木剛 on 2023/10/08.
//

import SwiftUI
import Observation


@Observable class PartyModel {
    var peopleInput = ""
    var pizzaInput = ""
    
    var peopleCount: Int? { Int(peopleInput) }
    var pizzaCount: Int? { Int(pizzaInput) }
    
    var calculatable: Bool {
        peopleCount != nil && 
        pizzaCount != nil &&
        peopleCount! > 0 &&
        pizzaCount! > 0
    }
    
    var output: String {
        guard let peopleCount, let pizzaCount,
              pizzaCount > 0, pizzaCount > 0 else {
            return "Please enter positive numbers fields above."
        }
        
        let each = pizzaCount * 8 / peopleCount
        let leftover = pizzaCount * 8 % peopleCount
        
        let output = """
        \(peopleCount) people with \(pizzaCount) pizzas
        Each person gets \(each) pieces of pizza.
        There are \(leftover) leftover piecies.
        """
        
        return output
    }
    
    var peopleDescription: String {
        guard let people = peopleCount else { return "" }
        if people == 1 {
            return "1 person"
        }
        return "\(people) people"
    }
    
    var pizzaDescription: String {
        guard let pizza = pizzaCount else { return "" }
        if pizza == 1 {
            return "1 pizza"
        }
        return "\(pizza) pizzas"
    }
}

struct PartyView {
    @Bindable var model = PartyModel()
}

extension PartyView: View {
    var body: some View {
        VStack {
            TextField("People Count", text: $model.peopleInput)
            TextField("Pizza Count", text: $model.pizzaInput)
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
    PartyView()
}

import Foundation

let length = Measurement(value: 15, unit: UnitLength.feet)
let width = Measurement(value: 20, unit: UnitLength.feet)

let area = Measurement(value: length.value * width.value, unit: UnitArea.squareFeet)
area.converted(to: .squareMeters)

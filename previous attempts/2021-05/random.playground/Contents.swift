import Foundation

let length = Measurement(value: 15, unit: UnitLength.feet)
let width = Measurement(value: 20, unit: UnitLength.meters)

let area = Measurement(value: length.value * width.value, unit: UnitArea.squareFeet)
area.converted(to: .squareMeters)

enum specifiedUnit {
    case feet
    case meter
}

let unit = specifiedUnit.feet

length.unit == UnitLength.feet

infix operator *

extension Measurement {
    
    static func * (lhs: Measurement<UnitLength>, rhs: Measurement<UnitLength>) -> Double {
        let area = lhs.value * rhs.value
        return area
        
//        switch lhs.unit {
//        case .feet:
//            return Measurement(value: area, unit: UnitArea.squareFeet)
//        default:
//            return Measurement(value: area, unit: UnitArea.squareMeters)
//        }
//
    }
    
}


length + width
length * width


import Foundation

public protocol Place {
    var id: NSNumber? { get set }
    var name: NSString? { get set }
    var location: Location? { get set }
}

public struct PlaceStruct: Place {
    public var id: NSNumber?
    public var name: NSString?
    public var location: Location?
}

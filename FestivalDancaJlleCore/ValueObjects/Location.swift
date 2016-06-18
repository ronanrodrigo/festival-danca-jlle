import Foundation

public protocol Location {
    var id: NSNumber? { get set }
    var city: NSString? { get set }
    var country: NSString? { get set }
    var latitude: NSNumber? { get set }
    var longitude: NSNumber? { get set }
    var state: NSNumber? { get set }
    var street: NSString? { get set }
}

public struct LocationStruct: Location {
    public var id: NSNumber?
    public var city: NSString?
    public var country: NSString?
    public var latitude: NSNumber?
    public var longitude: NSNumber?
    public var state: NSNumber?
    public var street: NSString?
}

import Foundation

public protocol Event {
    var id: NSNumber? { get set }
    var startTime: NSDate? { get set }
    var endTime: NSDate? { get set }
    var coverUrl: NSString? { get set }
    var coverData: NSData? { get set }
    var description: NSString? { get set }
    var place: Place? { get set }
}

public struct EventStruct: Event {
    public var id: NSNumber?
    public var startTime: NSDate?
    public var endTime: NSDate?
    public var coverUrl: NSString?
    public var coverData: NSData?
    public var description: NSString?
    public var place: Place?
}

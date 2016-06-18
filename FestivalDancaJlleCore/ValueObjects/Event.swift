import Foundation

public protocol Event {
    var id: NSNumber? { get set }
    var name: String? { get set }
    var startTime: NSDate? { get set }
    var endTime: NSDate? { get set }
    var coverUrl: String? { get set }
    var coverData: NSData? { get set }
    var description: String? { get set }
    var place: Place? { get set }
}

public struct EventStruct: Event {
    public var id: NSNumber?
    public var name: String?
    public var startTime: NSDate?
    public var endTime: NSDate?
    public var coverUrl: String?
    public var coverData: NSData?
    public var description: String?
    public var place: Place?

    public init() {

    }

    public init(id: NSNumber?, name: String?, startTime: NSDate?, endTime: NSDate?, coverUrl: String?, coverData:
            NSData?, description: String?, place: Place?) {
        self.id = id
        self.name = name
        self.startTime = startTime
        self.endTime = endTime
        self.coverUrl = coverUrl
        self.coverData = coverData
        self.description = description
        self.place = place
    }
}

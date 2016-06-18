import Foundation
import XCTest

class ListEventsUsecaseTests: XCTestCase {
    var listEventsUsecase: ListEventsUsecase!
    var eventsGatewaySpy: EventsGatewaySpy!
    var listEventsPresenterSpy: ListEventsPresenterSpy!

    override func setUp() {
        eventsGatewaySpy = EventsGatewaySpy()
        listEventsPresenterSpy = ListEventsPresenterSpy()
        listEventsUsecase = ListEventsUsecase(
            eventsGateway: eventsGatewaySpy,
            listEventsPresenter: listEventsPresenterSpy
        )
    }

    func testShouldListEventsWhenSuccess() {
        listEventsUsecase.list()

        XCTAssertTrue(eventsGatewaySpy.listSpied)
        XCTAssertTrue(listEventsPresenterSpy.successSpied)
        XCTAssertFalse(listEventsPresenterSpy.errorSpied)
    }

    func testShouldShowErrorWhenError() {
        eventsGatewaySpy.shouldSuccessed = false

        listEventsUsecase.list()

        XCTAssertTrue(eventsGatewaySpy.listSpied)
        XCTAssertTrue(listEventsPresenterSpy.errorSpied)
        XCTAssertFalse(listEventsPresenterSpy.successSpied)
    }

}

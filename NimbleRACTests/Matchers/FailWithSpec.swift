import Quick
import Nimble
import ReactiveCocoa
@testable import NimbleRAC

class FailWithSpec: QuickSpec {
    override func spec() {
        describe("failWith") {
            var producer: SignalProducer<String, NSError>!
            let error = NSError(domain: "foo", code: 1, userInfo: nil)
            let error2 = NSError(domain: "foo2", code: 2, userInfo: nil)

            it("positively matches a failed signal with same error") {
                producer = SignalProducer<String, NSError>(error: error)
                expect(producer).to(failWith(error))
            }

            it("negatively matches a failed signal with different error") {
                producer = SignalProducer<String, NSError>(error: error2)
                expect(producer).toNot(failWith(error))
            }

            it("negatively matches a non-completing singal") {
                producer = SignalProducer<String, NSError>.never
                expect(producer).toNot(failWith(error))
            }

            it("negatively matches a completing singal") {
                producer = SignalProducer<String, NSError>(value: "foo")
                expect(producer).toNot(failWith(error))
            }
        }
    }
}

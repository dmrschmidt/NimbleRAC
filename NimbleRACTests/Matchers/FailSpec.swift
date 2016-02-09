import Quick
import Nimble
import ReactiveCocoa
@testable import NimbleRAC

class FailSpec: QuickSpec {
    override func spec() {
        describe("fail") {
            var producer: SignalProducer<String, NSError>!

            it("positively matches a failed signal") {
                producer = SignalProducer<String, NSError>(error: NSError(domain: "foo", code: 1, userInfo: nil))
                expect(producer).to(fail())
            }

            it("negatively matches a non-completing singal") {
                producer = SignalProducer<String, NSError>.never
                expect(producer).toNot(fail())
            }

            it("negatively matches a completing singal") {
                producer = SignalProducer<String, NSError>(value: "foo")
                expect(producer).toNot(fail())
            }
        }
    }
}

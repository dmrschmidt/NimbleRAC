import Quick
import Nimble
import ReactiveCocoa
@testable import NimbleRAC

class CompleteSpec: QuickSpec {
    override func spec() {
        describe("complete") {
            var producer: SignalProducer<String, NSError>!

            it("positively matches a completing signal") {
                producer = SignalProducer<String, NSError>(value: "foo")
                expect(producer).to(complete())
            }

            it("negatively matches a non-completing singal") {
                producer = SignalProducer<String, NSError>.never
                expect(producer).toNot(complete())
            }
        }
    }
}

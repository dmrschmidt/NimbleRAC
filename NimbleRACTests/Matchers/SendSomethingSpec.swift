import Quick
import Nimble
import ReactiveCocoa
@testable import NimbleRAC

class SendSomethingSpec: QuickSpec {
    override func spec() {
        describe("sendSomething") {
            var producer: SignalProducer<String, NSError>!

            it("positively matches when sending something") {
                producer = SignalProducer<String, NSError>(value: "foo")
                expect(producer).to(sendSomething())
            }

            it("negatively matches when not sending something") {
                producer = SignalProducer<String, NSError>.never
                expect(producer).toNot(sendSomething())
            }
        }
    }
}

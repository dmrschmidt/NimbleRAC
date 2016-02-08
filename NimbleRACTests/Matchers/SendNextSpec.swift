import Quick
import Nimble
import ReactiveCocoa
@testable import NimbleRAC

class SendNextSpec: QuickSpec {
    override func spec() {
        describe("sendNext") {
            var producer: SignalProducer<String, NSError>!

            it("positively matches when sending correct Next") {
                producer = SignalProducer<String, NSError>(value: "foo")
                expect(producer).to(sendNext("foo"))
            }

            it("negatively matches when sending different Next") {
                producer = SignalProducer<String, NSError>(value: "foo")
                expect(producer).toNot(sendNext("bar"))
            }

            it("negatively matches when not sending anything") {
                producer = SignalProducer<String, NSError>.never
                expect(producer).toNot(sendNext("bar"))
            }
        }
    }
}

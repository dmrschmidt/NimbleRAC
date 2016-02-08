import Quick
import Nimble
import ReactiveCocoa
@testable import NimbleRAC

class SendNextSpec: QuickSpec {
    override func spec() {
        describe("sendNext") {
            it("positively matches when sending correct Next") {
                let producer = SignalProducer<String, NSError>(value: "foo")
                expect(producer).to(sendNext("foo"))
            }

            it("negatively matches when not sending anything") {
                let producer = SignalProducer<String, NSError>.never
                expect(producer).toNot(sendNext("bar"))
            }
        }
    }
}

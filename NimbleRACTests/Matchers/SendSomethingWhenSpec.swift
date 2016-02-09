import Quick
import Nimble
import ReactiveCocoa
@testable import NimbleRAC

class SendSomethingWhenSpec: QuickSpec {
    override func spec() {
        describe("sendSomethingWhen") {
            var producer: SignalProducer<String, NSError>!

            it("positively matches when sending something") {
                var trigger: (() -> ())!
                producer = SignalProducer<String, NSError> { observer, disposable in
                    trigger = { observer.sendNext("foo") }
                }
                defer { expect(producer).to(sendSomethingWhen(trigger)) }
            }

            it("negatively matches when not sending something") {
                producer = SignalProducer<String, NSError>.never
                expect(producer).toNot(sendSomethingWhen({}))
            }
        }
    }
}

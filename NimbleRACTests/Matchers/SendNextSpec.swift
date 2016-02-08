import Quick
import Nimble
@testable import NimbleRAC

class SendNextSpec: QuickSpec {
    override func spec() {
        describe("sendNext") {
            beforeEach { }

            describe("-pickImageFromLibrary") {
                it("does stuff") {
                    expect("foo").to(sendNext())
                }
            }
        }
    }
}

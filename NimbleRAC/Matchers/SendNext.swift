import Foundation
import Nimble
import ReactiveCocoa

/// A Nimble matcher that succeeds when the correct value is send.
public func sendNext<T: SignalProducerType where T.Value: Equatable>(expected: T.Value) -> NonNilMatcherFunc<T> {
    return NonNilMatcherFunc { actualExpression, failureMessage in
        failureMessage.postfixMessage = "send next"

        var actualValue: T.Value?
        if let producer = try actualExpression.evaluate() {
            producer.startWithNext { next in actualValue = next }
        }

        return actualValue == expected
    }
}

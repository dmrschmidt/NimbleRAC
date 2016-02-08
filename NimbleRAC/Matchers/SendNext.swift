import Foundation
import Nimble
import ReactiveCocoa

/// A Nimble matcher that succeeds when the correct value is send.
public func sendNext<T: SignalProducerType where T.Value: Equatable>(expected: T.Value) -> NonNilMatcherFunc<T> {
    return NonNilMatcherFunc { actualExpression, failureMessage in
        failureMessage.postfixMessage = "send next"
        guard let producer = try actualExpression.evaluate() else { return false }

        var actualValue: T.Value?
        producer.startWithNext { next in actualValue = next }

        return actualValue == expected
    }
}

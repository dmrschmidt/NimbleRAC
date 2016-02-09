import Foundation
import Nimble
import ReactiveCocoa

/**
 Nimble matcher that matches if passed `SignalProducer` sends a `Next` event.
 `SignalProducer` is started during matching.

 - parameter expected: value to compare against, needs to be `Equatable`.
 - returns: `true` if the `SignalProducer` sends `Next` event with expected value.
 */
public func sendNext<T: SignalProducerType where T.Value: Equatable>(expected: T.Value) -> NonNilMatcherFunc<T> {
    return NonNilMatcherFunc { actualExpression, failureMessage in
        failureMessage.postfixMessage = "send next"
        guard let producer = try actualExpression.evaluate() else { return false }

        var actualValue: T.Value?
        producer.startWithNext { next in actualValue = next }

        return actualValue == expected
    }
}

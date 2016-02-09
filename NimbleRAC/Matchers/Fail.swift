import Foundation
import Nimble
import ReactiveCocoa

/**
 Nimble matcher that matches if passed `SignalProducer` sends a `Failed` event.
 `SignalProducer` is started during matching.

 - returns: `true` if the `SignalProducer` sends `Failed` event.
 */
public func fail<T: SignalProducerType>() -> NonNilMatcherFunc<T> {
    return NonNilMatcherFunc { actualExpression, failureMessage in
        failureMessage.postfixMessage = "fail"
        guard let producer = try actualExpression.evaluate() else { return false }

        var failed = false
        producer.startWithFailed { _ in failed = true }

        return failed
    }
}

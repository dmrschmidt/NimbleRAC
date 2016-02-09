import Foundation
import Nimble
import ReactiveCocoa

/**
 Nimble matcher that matches if passed `SignalProducer` sends a `Completed` event.
 `SignalProducer` is started during matching.

 - returns: `true` if the `SignalProducer` sends `Completed` event.
 */
public func complete<T: SignalProducerType>() -> NonNilMatcherFunc<T> {
    return NonNilMatcherFunc { actualExpression, failureMessage in
        failureMessage.postfixMessage = "complete"
        guard let producer = try actualExpression.evaluate() else { return false }

        var completed = false
        producer.startWithCompleted { completed = true }

        return completed
    }
}

import Foundation
import Nimble
import ReactiveCocoa

/**
 Nimble matcher that matches if passed `SignalProducer` sends any `Next`
 when `trigger` is executed.
 `SignalProducer` is started during matching.

 - parameter trigger: closure expected to trigger the `Next` event
 - returns: `true` if the `SignalProducer` sends any `Next` event
 */
public func sendSomethingWhen<T: SignalProducerType>(trigger: () -> ()) -> NonNilMatcherFunc<T> {
    return NonNilMatcherFunc { actualExpression, failureMessage in
        failureMessage.postfixMessage = "send something when"
        guard let producer = try actualExpression.evaluate() else { return false }

        var sentSomething = false
        producer.startWithNext { _ in sentSomething = true }
        trigger()

        return sentSomething
    }
}

import Foundation
import Nimble
import ReactiveCocoa

/// A Nimble matcher that succeeds when anything is sent.
public func sendSomething<T: SignalProducerType>() -> NonNilMatcherFunc<T> {
    return NonNilMatcherFunc { actualExpression, failureMessage in
        failureMessage.postfixMessage = "send anything"

        var sentSomething = false
        if let producer = try actualExpression.evaluate() {
            producer.startWithNext { _ in sentSomething = true }
        }

        return sentSomething
    }
}

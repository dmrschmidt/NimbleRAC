import Foundation
import Nimble
import ReactiveCocoa

/**
 Nimble matcher that matches if passed SignalProducer sends any Next.
 SignalProducer is started during matching.

 - returns: true if the signal producer sends any Next event
 */
public func sendSomething<T: SignalProducerType>() -> NonNilMatcherFunc<T> {
    return NonNilMatcherFunc { actualExpression, failureMessage in
        failureMessage.postfixMessage = "send anything"
        guard let producer = try actualExpression.evaluate() else { return false }

        var sentSomething = false
        producer.startWithNext { _ in sentSomething = true }

        return sentSomething
    }
}

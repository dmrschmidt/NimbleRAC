import Foundation
import Nimble
import ReactiveCocoa

/// A Nimble matcher that succeeds when the SingalProducer completes.
public func complete<T: SignalProducerType>() -> NonNilMatcherFunc<T> {
    return NonNilMatcherFunc { actualExpression, failureMessage in
        failureMessage.postfixMessage = "complete"
        guard let producer = try actualExpression.evaluate() else { return false }

        var completed = false
        producer.startWithCompleted { completed = true }

        return completed
    }
}

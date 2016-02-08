import Foundation
import Nimble
import ReactiveCocoa

/// A Nimble matcher that succeeds when the SingalProducer completes.
public func complete<T: SignalProducerType>() -> NonNilMatcherFunc<T> {
    return NonNilMatcherFunc { actualExpression, failureMessage in
        failureMessage.postfixMessage = "complete"
        let actualValue = try actualExpression.evaluate()

        var completed = false
        actualValue?.startWithCompleted { completed = true }

        return completed
    }
}

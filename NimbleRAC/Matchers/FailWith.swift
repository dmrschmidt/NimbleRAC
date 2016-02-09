import Foundation
import Nimble
import ReactiveCocoa

/**
 Nimble matcher that matches if passed `SignalProducer` sends a `Failed` event
 and the error matches.
 `SignalProducer` is started during matching.

 - parameter error: expected error to compare against, needs to be `Equatable`.
 - returns: `true` if the `SignalProducer` sends `Failed` event.
 */
public func failWith<T: SignalProducerType where T.Error: Equatable>(error: T.Error) -> NonNilMatcherFunc<T> {
    return NonNilMatcherFunc { actualExpression, failureMessage in
        failureMessage.postfixMessage = "fail"
        guard let producer = try actualExpression.evaluate() else { return false }

        var actualError: T.Error?
        producer.startWithFailed { error in actualError = error }

        guard let receivedError = actualError else { return false }

        return error == receivedError
    }
}

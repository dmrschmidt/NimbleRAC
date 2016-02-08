import Foundation
import Nimble
import ReactiveCocoa

/// A Nimble matcher that succeeds when anything is sent.
public func sendSomething() -> MatcherFunc<SignalProducer<String, NSError>> {
    return MatcherFunc { actualExpression, failureMessage in
        failureMessage.postfixMessage = "send anything"

        var actualValue: String?
        if let producer = try actualExpression.evaluate() {
            producer.startWithNext { next in actualValue = next }
        }

        return actualValue != nil
    }
}

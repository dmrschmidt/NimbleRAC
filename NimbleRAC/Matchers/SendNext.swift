import Foundation
import Nimble

/// A Nimble matcher that succeeds when the actual value is nil.
public func sendNext<T>() -> MatcherFunc<T> {
    return MatcherFunc { actualExpression, failureMessage in
        failureMessage.postfixMessage = "send next"
        let actualValue = try actualExpression.evaluate()
        return actualValue == nil
    }
}

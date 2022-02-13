// Generated using Sourcery 1.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// Generated with SwiftyMocky 4.1.0
// Required Sourcery: 1.6.0


import SwiftyMocky
import XCTest
import SharedUtilities
@testable import CoreLayout


// MARK: - ScrollViewLayoutPaginatorDelegate

open class ScrollViewLayoutPaginatorDelegateMock: ScrollViewLayoutPaginatorDelegate, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func scrollViewDidReachBottomThreshold(_ scrollView: UIScrollView) {
        addInvocation(.m_scrollViewDidReachBottomThreshold__scrollView(Parameter<UIScrollView>.value(`scrollView`)))
		let perform = methodPerformValue(.m_scrollViewDidReachBottomThreshold__scrollView(Parameter<UIScrollView>.value(`scrollView`))) as? (UIScrollView) -> Void
		perform?(`scrollView`)
    }


    fileprivate enum MethodType {
        case m_scrollViewDidReachBottomThreshold__scrollView(Parameter<UIScrollView>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_scrollViewDidReachBottomThreshold__scrollView(let lhsScrollview), .m_scrollViewDidReachBottomThreshold__scrollView(let rhsScrollview)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsScrollview, rhs: rhsScrollview, with: matcher), lhsScrollview, rhsScrollview, "_ scrollView"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_scrollViewDidReachBottomThreshold__scrollView(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_scrollViewDidReachBottomThreshold__scrollView: return ".scrollViewDidReachBottomThreshold(_:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func scrollViewDidReachBottomThreshold(_ scrollView: Parameter<UIScrollView>) -> Verify { return Verify(method: .m_scrollViewDidReachBottomThreshold__scrollView(`scrollView`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func scrollViewDidReachBottomThreshold(_ scrollView: Parameter<UIScrollView>, perform: @escaping (UIScrollView) -> Void) -> Perform {
            return Perform(method: .m_scrollViewDidReachBottomThreshold__scrollView(`scrollView`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - ScrollViewLayoutPaginatorProtocol

open class ScrollViewLayoutPaginatorProtocolMock: ScrollViewLayoutPaginatorProtocol, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func scrollViewDidScroll(_ scrollView: UIScrollView) {
        addInvocation(.m_scrollViewDidScroll__scrollView(Parameter<UIScrollView>.value(`scrollView`)))
		let perform = methodPerformValue(.m_scrollViewDidScroll__scrollView(Parameter<UIScrollView>.value(`scrollView`))) as? (UIScrollView) -> Void
		perform?(`scrollView`)
    }


    fileprivate enum MethodType {
        case m_scrollViewDidScroll__scrollView(Parameter<UIScrollView>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_scrollViewDidScroll__scrollView(let lhsScrollview), .m_scrollViewDidScroll__scrollView(let rhsScrollview)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsScrollview, rhs: rhsScrollview, with: matcher), lhsScrollview, rhsScrollview, "_ scrollView"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_scrollViewDidScroll__scrollView(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_scrollViewDidScroll__scrollView: return ".scrollViewDidScroll(_:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func scrollViewDidScroll(_ scrollView: Parameter<UIScrollView>) -> Verify { return Verify(method: .m_scrollViewDidScroll__scrollView(`scrollView`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func scrollViewDidScroll(_ scrollView: Parameter<UIScrollView>, perform: @escaping (UIScrollView) -> Void) -> Perform {
            return Perform(method: .m_scrollViewDidScroll__scrollView(`scrollView`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - ShowGlobalMessageProtocol

open class ShowGlobalMessageProtocolMock: ShowGlobalMessageProtocol, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func showWarning(warningMessage: String, buttonTitle: String, buttonHandler: @escaping (UIButton) -> Void) {
        addInvocation(.m_showWarning__warningMessage_warningMessagebuttonTitle_buttonTitlebuttonHandler_buttonHandler(Parameter<String>.value(`warningMessage`), Parameter<String>.value(`buttonTitle`), Parameter<(UIButton) -> Void>.value(`buttonHandler`)))
		let perform = methodPerformValue(.m_showWarning__warningMessage_warningMessagebuttonTitle_buttonTitlebuttonHandler_buttonHandler(Parameter<String>.value(`warningMessage`), Parameter<String>.value(`buttonTitle`), Parameter<(UIButton) -> Void>.value(`buttonHandler`))) as? (String, String, @escaping (UIButton) -> Void) -> Void
		perform?(`warningMessage`, `buttonTitle`, `buttonHandler`)
    }

    open func showSuccess(successMessage: String) {
        addInvocation(.m_showSuccess__successMessage_successMessage(Parameter<String>.value(`successMessage`)))
		let perform = methodPerformValue(.m_showSuccess__successMessage_successMessage(Parameter<String>.value(`successMessage`))) as? (String) -> Void
		perform?(`successMessage`)
    }

    open func showError(error: Error) {
        addInvocation(.m_showError__error_error(Parameter<Error>.value(`error`)))
		let perform = methodPerformValue(.m_showError__error_error(Parameter<Error>.value(`error`))) as? (Error) -> Void
		perform?(`error`)
    }

    open func showError(errorMessage: String) {
        addInvocation(.m_showError__errorMessage_errorMessage(Parameter<String>.value(`errorMessage`)))
		let perform = methodPerformValue(.m_showError__errorMessage_errorMessage(Parameter<String>.value(`errorMessage`))) as? (String) -> Void
		perform?(`errorMessage`)
    }

    open func showWarning(warningMessage: String) {
        addInvocation(.m_showWarning__warningMessage_warningMessage(Parameter<String>.value(`warningMessage`)))
		let perform = methodPerformValue(.m_showWarning__warningMessage_warningMessage(Parameter<String>.value(`warningMessage`))) as? (String) -> Void
		perform?(`warningMessage`)
    }


    fileprivate enum MethodType {
        case m_showWarning__warningMessage_warningMessagebuttonTitle_buttonTitlebuttonHandler_buttonHandler(Parameter<String>, Parameter<String>, Parameter<(UIButton) -> Void>)
        case m_showSuccess__successMessage_successMessage(Parameter<String>)
        case m_showError__error_error(Parameter<Error>)
        case m_showError__errorMessage_errorMessage(Parameter<String>)
        case m_showWarning__warningMessage_warningMessage(Parameter<String>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_showWarning__warningMessage_warningMessagebuttonTitle_buttonTitlebuttonHandler_buttonHandler(let lhsWarningmessage, let lhsButtontitle, let lhsButtonhandler), .m_showWarning__warningMessage_warningMessagebuttonTitle_buttonTitlebuttonHandler_buttonHandler(let rhsWarningmessage, let rhsButtontitle, let rhsButtonhandler)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsWarningmessage, rhs: rhsWarningmessage, with: matcher), lhsWarningmessage, rhsWarningmessage, "warningMessage"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsButtontitle, rhs: rhsButtontitle, with: matcher), lhsButtontitle, rhsButtontitle, "buttonTitle"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsButtonhandler, rhs: rhsButtonhandler, with: matcher), lhsButtonhandler, rhsButtonhandler, "buttonHandler"))
				return Matcher.ComparisonResult(results)

            case (.m_showSuccess__successMessage_successMessage(let lhsSuccessmessage), .m_showSuccess__successMessage_successMessage(let rhsSuccessmessage)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsSuccessmessage, rhs: rhsSuccessmessage, with: matcher), lhsSuccessmessage, rhsSuccessmessage, "successMessage"))
				return Matcher.ComparisonResult(results)

            case (.m_showError__error_error(let lhsError), .m_showError__error_error(let rhsError)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsError, rhs: rhsError, with: matcher), lhsError, rhsError, "error"))
				return Matcher.ComparisonResult(results)

            case (.m_showError__errorMessage_errorMessage(let lhsErrormessage), .m_showError__errorMessage_errorMessage(let rhsErrormessage)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsErrormessage, rhs: rhsErrormessage, with: matcher), lhsErrormessage, rhsErrormessage, "errorMessage"))
				return Matcher.ComparisonResult(results)

            case (.m_showWarning__warningMessage_warningMessage(let lhsWarningmessage), .m_showWarning__warningMessage_warningMessage(let rhsWarningmessage)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsWarningmessage, rhs: rhsWarningmessage, with: matcher), lhsWarningmessage, rhsWarningmessage, "warningMessage"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_showWarning__warningMessage_warningMessagebuttonTitle_buttonTitlebuttonHandler_buttonHandler(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
            case let .m_showSuccess__successMessage_successMessage(p0): return p0.intValue
            case let .m_showError__error_error(p0): return p0.intValue
            case let .m_showError__errorMessage_errorMessage(p0): return p0.intValue
            case let .m_showWarning__warningMessage_warningMessage(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_showWarning__warningMessage_warningMessagebuttonTitle_buttonTitlebuttonHandler_buttonHandler: return ".showWarning(warningMessage:buttonTitle:buttonHandler:)"
            case .m_showSuccess__successMessage_successMessage: return ".showSuccess(successMessage:)"
            case .m_showError__error_error: return ".showError(error:)"
            case .m_showError__errorMessage_errorMessage: return ".showError(errorMessage:)"
            case .m_showWarning__warningMessage_warningMessage: return ".showWarning(warningMessage:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func showWarning(warningMessage: Parameter<String>, buttonTitle: Parameter<String>, buttonHandler: Parameter<(UIButton) -> Void>) -> Verify { return Verify(method: .m_showWarning__warningMessage_warningMessagebuttonTitle_buttonTitlebuttonHandler_buttonHandler(`warningMessage`, `buttonTitle`, `buttonHandler`))}
        public static func showSuccess(successMessage: Parameter<String>) -> Verify { return Verify(method: .m_showSuccess__successMessage_successMessage(`successMessage`))}
        public static func showError(error: Parameter<Error>) -> Verify { return Verify(method: .m_showError__error_error(`error`))}
        public static func showError(errorMessage: Parameter<String>) -> Verify { return Verify(method: .m_showError__errorMessage_errorMessage(`errorMessage`))}
        public static func showWarning(warningMessage: Parameter<String>) -> Verify { return Verify(method: .m_showWarning__warningMessage_warningMessage(`warningMessage`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func showWarning(warningMessage: Parameter<String>, buttonTitle: Parameter<String>, buttonHandler: Parameter<(UIButton) -> Void>, perform: @escaping (String, String, @escaping (UIButton) -> Void) -> Void) -> Perform {
            return Perform(method: .m_showWarning__warningMessage_warningMessagebuttonTitle_buttonTitlebuttonHandler_buttonHandler(`warningMessage`, `buttonTitle`, `buttonHandler`), performs: perform)
        }
        public static func showSuccess(successMessage: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_showSuccess__successMessage_successMessage(`successMessage`), performs: perform)
        }
        public static func showError(error: Parameter<Error>, perform: @escaping (Error) -> Void) -> Perform {
            return Perform(method: .m_showError__error_error(`error`), performs: perform)
        }
        public static func showError(errorMessage: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_showError__errorMessage_errorMessage(`errorMessage`), performs: perform)
        }
        public static func showWarning(warningMessage: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_showWarning__warningMessage_warningMessage(`warningMessage`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}


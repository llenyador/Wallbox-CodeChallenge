// Generated using Sourcery 1.6.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// Generated with SwiftyMocky 4.1.0
// Required Sourcery: 1.6.0


import SwiftyMocky
import XCTest
import SharedUtilities
import Combine
import EMSDomain
@testable import EMSDisplay


// MARK: - DashboardInteractorProtocol

open class DashboardInteractorProtocolMock: DashboardInteractorProtocol, Mock {
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





    open func viewDidLoad() {
        addInvocation(.m_viewDidLoad)
		let perform = methodPerformValue(.m_viewDidLoad) as? () -> Void
		perform?()
    }

    open func didTapLiveStatsView() {
        addInvocation(.m_didTapLiveStatsView)
		let perform = methodPerformValue(.m_didTapLiveStatsView) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_viewDidLoad
        case m_didTapLiveStatsView

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_viewDidLoad, .m_viewDidLoad): return .match

            case (.m_didTapLiveStatsView, .m_didTapLiveStatsView): return .match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_viewDidLoad: return 0
            case .m_didTapLiveStatsView: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_viewDidLoad: return ".viewDidLoad()"
            case .m_didTapLiveStatsView: return ".didTapLiveStatsView()"
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

        public static func viewDidLoad() -> Verify { return Verify(method: .m_viewDidLoad)}
        public static func didTapLiveStatsView() -> Verify { return Verify(method: .m_didTapLiveStatsView)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func viewDidLoad(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_viewDidLoad, performs: perform)
        }
        public static func didTapLiveStatsView(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_didTapLiveStatsView, performs: perform)
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

// MARK: - DashboardPresenterProtocol

open class DashboardPresenterProtocolMock: DashboardPresenterProtocol, Mock {
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





    open func present(data: DashboardModels.Data) {
        addInvocation(.m_present__data_data(Parameter<DashboardModels.Data>.value(`data`)))
		let perform = methodPerformValue(.m_present__data_data(Parameter<DashboardModels.Data>.value(`data`))) as? (DashboardModels.Data) -> Void
		perform?(`data`)
    }

    open func present(error: Error) {
        addInvocation(.m_present__error_error(Parameter<Error>.value(`error`)))
		let perform = methodPerformValue(.m_present__error_error(Parameter<Error>.value(`error`))) as? (Error) -> Void
		perform?(`error`)
    }

    open func presentLoading() {
        addInvocation(.m_presentLoading)
		let perform = methodPerformValue(.m_presentLoading) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_present__data_data(Parameter<DashboardModels.Data>)
        case m_present__error_error(Parameter<Error>)
        case m_presentLoading

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_present__data_data(let lhsData), .m_present__data_data(let rhsData)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsData, rhs: rhsData, with: matcher), lhsData, rhsData, "data"))
				return Matcher.ComparisonResult(results)

            case (.m_present__error_error(let lhsError), .m_present__error_error(let rhsError)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsError, rhs: rhsError, with: matcher), lhsError, rhsError, "error"))
				return Matcher.ComparisonResult(results)

            case (.m_presentLoading, .m_presentLoading): return .match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_present__data_data(p0): return p0.intValue
            case let .m_present__error_error(p0): return p0.intValue
            case .m_presentLoading: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_present__data_data: return ".present(data:)"
            case .m_present__error_error: return ".present(error:)"
            case .m_presentLoading: return ".presentLoading()"
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

        public static func present(data: Parameter<DashboardModels.Data>) -> Verify { return Verify(method: .m_present__data_data(`data`))}
        public static func present(error: Parameter<Error>) -> Verify { return Verify(method: .m_present__error_error(`error`))}
        public static func presentLoading() -> Verify { return Verify(method: .m_presentLoading)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func present(data: Parameter<DashboardModels.Data>, perform: @escaping (DashboardModels.Data) -> Void) -> Perform {
            return Perform(method: .m_present__data_data(`data`), performs: perform)
        }
        public static func present(error: Parameter<Error>, perform: @escaping (Error) -> Void) -> Perform {
            return Perform(method: .m_present__error_error(`error`), performs: perform)
        }
        public static func presentLoading(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_presentLoading, performs: perform)
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

// MARK: - DashboardRouterProtocol

open class DashboardRouterProtocolMock: DashboardRouterProtocol, Mock {
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





    open func routeToStats() {
        addInvocation(.m_routeToStats)
		let perform = methodPerformValue(.m_routeToStats) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_routeToStats

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_routeToStats, .m_routeToStats): return .match
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_routeToStats: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_routeToStats: return ".routeToStats()"
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

        public static func routeToStats() -> Verify { return Verify(method: .m_routeToStats)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func routeToStats(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_routeToStats, performs: perform)
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

// MARK: - DashboardViewControllerProtocol

open class DashboardViewControllerProtocolMock: DashboardViewControllerProtocol, Mock {
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





    open func display(state: DashboardModels.ViewState) {
        addInvocation(.m_display__state_state(Parameter<DashboardModels.ViewState>.value(`state`)))
		let perform = methodPerformValue(.m_display__state_state(Parameter<DashboardModels.ViewState>.value(`state`))) as? (DashboardModels.ViewState) -> Void
		perform?(`state`)
    }


    fileprivate enum MethodType {
        case m_display__state_state(Parameter<DashboardModels.ViewState>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_display__state_state(let lhsState), .m_display__state_state(let rhsState)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsState, rhs: rhsState, with: matcher), lhsState, rhsState, "state"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_display__state_state(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_display__state_state: return ".display(state:)"
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

        public static func display(state: Parameter<DashboardModels.ViewState>) -> Verify { return Verify(method: .m_display__state_state(`state`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func display(state: Parameter<DashboardModels.ViewState>, perform: @escaping (DashboardModels.ViewState) -> Void) -> Perform {
            return Perform(method: .m_display__state_state(`state`), performs: perform)
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

// MARK: - DashboardViewDelegate

open class DashboardViewDelegateMock: DashboardViewDelegate, Mock {
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





    open func didTapLiveStatsView() {
        addInvocation(.m_didTapLiveStatsView)
		let perform = methodPerformValue(.m_didTapLiveStatsView) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_didTapLiveStatsView

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_didTapLiveStatsView, .m_didTapLiveStatsView): return .match
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_didTapLiveStatsView: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_didTapLiveStatsView: return ".didTapLiveStatsView()"
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

        public static func didTapLiveStatsView() -> Verify { return Verify(method: .m_didTapLiveStatsView)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func didTapLiveStatsView(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_didTapLiveStatsView, performs: perform)
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

// MARK: - DashboardWorkerProtocol

open class DashboardWorkerProtocolMock: DashboardWorkerProtocol, Mock {
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





    open func getData() -> PublisherResult<DashboardModels.Data> {
        addInvocation(.m_getData)
		let perform = methodPerformValue(.m_getData) as? () -> Void
		perform?()
		var __value: PublisherResult<DashboardModels.Data>
		do {
		    __value = try methodReturnValue(.m_getData).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getData(). Use given")
			Failure("Stub return value not specified for getData(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getData

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getData, .m_getData): return .match
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_getData: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getData: return ".getData()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getData(willReturn: PublisherResult<DashboardModels.Data>...) -> MethodStub {
            return Given(method: .m_getData, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getData(willProduce: (Stubber<PublisherResult<DashboardModels.Data>>) -> Void) -> MethodStub {
            let willReturn: [PublisherResult<DashboardModels.Data>] = []
			let given: Given = { return Given(method: .m_getData, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (PublisherResult<DashboardModels.Data>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getData() -> Verify { return Verify(method: .m_getData)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getData(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_getData, performs: perform)
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

// MARK: - HistoricalPlotsInteractorProtocol

open class HistoricalPlotsInteractorProtocolMock: HistoricalPlotsInteractorProtocol, Mock {
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





    open func viewDidLoad() {
        addInvocation(.m_viewDidLoad)
		let perform = methodPerformValue(.m_viewDidLoad) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_viewDidLoad

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_viewDidLoad, .m_viewDidLoad): return .match
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_viewDidLoad: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_viewDidLoad: return ".viewDidLoad()"
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

        public static func viewDidLoad() -> Verify { return Verify(method: .m_viewDidLoad)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func viewDidLoad(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_viewDidLoad, performs: perform)
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

// MARK: - HistoricalPlotsPresenterProtocol

open class HistoricalPlotsPresenterProtocolMock: HistoricalPlotsPresenterProtocol, Mock {
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





    open func present(data: [HistoricalData]) {
        addInvocation(.m_present__data_data(Parameter<[HistoricalData]>.value(`data`)))
		let perform = methodPerformValue(.m_present__data_data(Parameter<[HistoricalData]>.value(`data`))) as? ([HistoricalData]) -> Void
		perform?(`data`)
    }

    open func present(error: Error) {
        addInvocation(.m_present__error_error(Parameter<Error>.value(`error`)))
		let perform = methodPerformValue(.m_present__error_error(Parameter<Error>.value(`error`))) as? (Error) -> Void
		perform?(`error`)
    }

    open func presentLoading() {
        addInvocation(.m_presentLoading)
		let perform = methodPerformValue(.m_presentLoading) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_present__data_data(Parameter<[HistoricalData]>)
        case m_present__error_error(Parameter<Error>)
        case m_presentLoading

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_present__data_data(let lhsData), .m_present__data_data(let rhsData)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsData, rhs: rhsData, with: matcher), lhsData, rhsData, "data"))
				return Matcher.ComparisonResult(results)

            case (.m_present__error_error(let lhsError), .m_present__error_error(let rhsError)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsError, rhs: rhsError, with: matcher), lhsError, rhsError, "error"))
				return Matcher.ComparisonResult(results)

            case (.m_presentLoading, .m_presentLoading): return .match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_present__data_data(p0): return p0.intValue
            case let .m_present__error_error(p0): return p0.intValue
            case .m_presentLoading: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_present__data_data: return ".present(data:)"
            case .m_present__error_error: return ".present(error:)"
            case .m_presentLoading: return ".presentLoading()"
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

        public static func present(data: Parameter<[HistoricalData]>) -> Verify { return Verify(method: .m_present__data_data(`data`))}
        public static func present(error: Parameter<Error>) -> Verify { return Verify(method: .m_present__error_error(`error`))}
        public static func presentLoading() -> Verify { return Verify(method: .m_presentLoading)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func present(data: Parameter<[HistoricalData]>, perform: @escaping ([HistoricalData]) -> Void) -> Perform {
            return Perform(method: .m_present__data_data(`data`), performs: perform)
        }
        public static func present(error: Parameter<Error>, perform: @escaping (Error) -> Void) -> Perform {
            return Perform(method: .m_present__error_error(`error`), performs: perform)
        }
        public static func presentLoading(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_presentLoading, performs: perform)
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

// MARK: - HistoricalPlotsRouterProtocol

open class HistoricalPlotsRouterProtocolMock: HistoricalPlotsRouterProtocol, Mock {
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






    fileprivate struct MethodType {
        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult { return .match }
        func intValue() -> Int { return 0 }
        func assertionName() -> String { return "" }
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

    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

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

// MARK: - HistoricalPlotsViewControllerProtocol

open class HistoricalPlotsViewControllerProtocolMock: HistoricalPlotsViewControllerProtocol, Mock {
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





    open func display(state: HistoricalPlotsModels.ViewState) {
        addInvocation(.m_display__state_state(Parameter<HistoricalPlotsModels.ViewState>.value(`state`)))
		let perform = methodPerformValue(.m_display__state_state(Parameter<HistoricalPlotsModels.ViewState>.value(`state`))) as? (HistoricalPlotsModels.ViewState) -> Void
		perform?(`state`)
    }


    fileprivate enum MethodType {
        case m_display__state_state(Parameter<HistoricalPlotsModels.ViewState>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_display__state_state(let lhsState), .m_display__state_state(let rhsState)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsState, rhs: rhsState, with: matcher), lhsState, rhsState, "state"))
				return Matcher.ComparisonResult(results)
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_display__state_state(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_display__state_state: return ".display(state:)"
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

        public static func display(state: Parameter<HistoricalPlotsModels.ViewState>) -> Verify { return Verify(method: .m_display__state_state(`state`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func display(state: Parameter<HistoricalPlotsModels.ViewState>, perform: @escaping (HistoricalPlotsModels.ViewState) -> Void) -> Perform {
            return Perform(method: .m_display__state_state(`state`), performs: perform)
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

// MARK: - HistoricalPlotsViewDelegate

open class HistoricalPlotsViewDelegateMock: HistoricalPlotsViewDelegate, Mock {
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






    fileprivate struct MethodType {
        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult { return .match }
        func intValue() -> Int { return 0 }
        func assertionName() -> String { return "" }
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

    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

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

// MARK: - HistoricalPlotsWorkerProtocol

open class HistoricalPlotsWorkerProtocolMock: HistoricalPlotsWorkerProtocol, Mock {
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





    open func getHistoricalData() -> PublisherResult<[HistoricalData]> {
        addInvocation(.m_getHistoricalData)
		let perform = methodPerformValue(.m_getHistoricalData) as? () -> Void
		perform?()
		var __value: PublisherResult<[HistoricalData]>
		do {
		    __value = try methodReturnValue(.m_getHistoricalData).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getHistoricalData(). Use given")
			Failure("Stub return value not specified for getHistoricalData(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getHistoricalData

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getHistoricalData, .m_getHistoricalData): return .match
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_getHistoricalData: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getHistoricalData: return ".getHistoricalData()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getHistoricalData(willReturn: PublisherResult<[HistoricalData]>...) -> MethodStub {
            return Given(method: .m_getHistoricalData, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getHistoricalData(willProduce: (Stubber<PublisherResult<[HistoricalData]>>) -> Void) -> MethodStub {
            let willReturn: [PublisherResult<[HistoricalData]>] = []
			let given: Given = { return Given(method: .m_getHistoricalData, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (PublisherResult<[HistoricalData]>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getHistoricalData() -> Verify { return Verify(method: .m_getHistoricalData)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getHistoricalData(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_getHistoricalData, performs: perform)
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

// MARK: - NetworkClientProtocol

open class NetworkClientProtocolMock: NetworkClientProtocol, Mock {
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





    open func perform(endpoint: EndpointProtocol, waitsUntilConnected: Bool) -> AnyPublisher<Void, Error> {
        addInvocation(.m_perform__endpoint_endpointwaitsUntilConnected_waitsUntilConnected(Parameter<EndpointProtocol>.value(`endpoint`), Parameter<Bool>.value(`waitsUntilConnected`)))
		let perform = methodPerformValue(.m_perform__endpoint_endpointwaitsUntilConnected_waitsUntilConnected(Parameter<EndpointProtocol>.value(`endpoint`), Parameter<Bool>.value(`waitsUntilConnected`))) as? (EndpointProtocol, Bool) -> Void
		perform?(`endpoint`, `waitsUntilConnected`)
		var __value: AnyPublisher<Void, Error>
		do {
		    __value = try methodReturnValue(.m_perform__endpoint_endpointwaitsUntilConnected_waitsUntilConnected(Parameter<EndpointProtocol>.value(`endpoint`), Parameter<Bool>.value(`waitsUntilConnected`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for perform(endpoint: EndpointProtocol, waitsUntilConnected: Bool). Use given")
			Failure("Stub return value not specified for perform(endpoint: EndpointProtocol, waitsUntilConnected: Bool). Use given")
		}
		return __value
    }

    open func perform<M: MapperProtocol>(endpoint: EndpointProtocol, mapper: M.Type, waitsUntilConnected: Bool) -> AnyPublisher<M.Output, Error> where M.Input: Decodable {
        addInvocation(.m_perform__endpoint_endpointmapper_mapperwaitsUntilConnected_waitsUntilConnected(Parameter<EndpointProtocol>.value(`endpoint`), Parameter<M.Type>.value(`mapper`).wrapAsGeneric(), Parameter<Bool>.value(`waitsUntilConnected`)))
		let perform = methodPerformValue(.m_perform__endpoint_endpointmapper_mapperwaitsUntilConnected_waitsUntilConnected(Parameter<EndpointProtocol>.value(`endpoint`), Parameter<M.Type>.value(`mapper`).wrapAsGeneric(), Parameter<Bool>.value(`waitsUntilConnected`))) as? (EndpointProtocol, M.Type, Bool) -> Void
		perform?(`endpoint`, `mapper`, `waitsUntilConnected`)
		var __value: AnyPublisher<M.Output, Error>
		do {
		    __value = try methodReturnValue(.m_perform__endpoint_endpointmapper_mapperwaitsUntilConnected_waitsUntilConnected(Parameter<EndpointProtocol>.value(`endpoint`), Parameter<M.Type>.value(`mapper`).wrapAsGeneric(), Parameter<Bool>.value(`waitsUntilConnected`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for perform<M: MapperProtocol>(endpoint: EndpointProtocol, mapper: M.Type, waitsUntilConnected: Bool). Use given")
			Failure("Stub return value not specified for perform<M: MapperProtocol>(endpoint: EndpointProtocol, mapper: M.Type, waitsUntilConnected: Bool). Use given")
		}
		return __value
    }

    open func perform<M: MapperProtocol>(endpoint: EndpointProtocol, arrayMapper: M.Type, waitsUntilConnected: Bool) -> AnyPublisher<[M.Output], Error> where M.Input: Decodable {
        addInvocation(.m_perform__endpoint_endpointarrayMapper_arrayMapperwaitsUntilConnected_waitsUntilConnected(Parameter<EndpointProtocol>.value(`endpoint`), Parameter<M.Type>.value(`arrayMapper`).wrapAsGeneric(), Parameter<Bool>.value(`waitsUntilConnected`)))
		let perform = methodPerformValue(.m_perform__endpoint_endpointarrayMapper_arrayMapperwaitsUntilConnected_waitsUntilConnected(Parameter<EndpointProtocol>.value(`endpoint`), Parameter<M.Type>.value(`arrayMapper`).wrapAsGeneric(), Parameter<Bool>.value(`waitsUntilConnected`))) as? (EndpointProtocol, M.Type, Bool) -> Void
		perform?(`endpoint`, `arrayMapper`, `waitsUntilConnected`)
		var __value: AnyPublisher<[M.Output], Error>
		do {
		    __value = try methodReturnValue(.m_perform__endpoint_endpointarrayMapper_arrayMapperwaitsUntilConnected_waitsUntilConnected(Parameter<EndpointProtocol>.value(`endpoint`), Parameter<M.Type>.value(`arrayMapper`).wrapAsGeneric(), Parameter<Bool>.value(`waitsUntilConnected`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for perform<M: MapperProtocol>(endpoint: EndpointProtocol, arrayMapper: M.Type, waitsUntilConnected: Bool). Use given")
			Failure("Stub return value not specified for perform<M: MapperProtocol>(endpoint: EndpointProtocol, arrayMapper: M.Type, waitsUntilConnected: Bool). Use given")
		}
		return __value
    }

    open func perform<M: MapperProtocol>(endpoint: EndpointProtocol, mapper: M.Type) -> AnyPublisher<M.Output, Error> where M.Input: Decodable {
        addInvocation(.m_perform__endpoint_endpointmapper_mapper(Parameter<EndpointProtocol>.value(`endpoint`), Parameter<M.Type>.value(`mapper`).wrapAsGeneric()))
		let perform = methodPerformValue(.m_perform__endpoint_endpointmapper_mapper(Parameter<EndpointProtocol>.value(`endpoint`), Parameter<M.Type>.value(`mapper`).wrapAsGeneric())) as? (EndpointProtocol, M.Type) -> Void
		perform?(`endpoint`, `mapper`)
		var __value: AnyPublisher<M.Output, Error>
		do {
		    __value = try methodReturnValue(.m_perform__endpoint_endpointmapper_mapper(Parameter<EndpointProtocol>.value(`endpoint`), Parameter<M.Type>.value(`mapper`).wrapAsGeneric())).casted()
		} catch {
			onFatalFailure("Stub return value not specified for perform<M: MapperProtocol>(endpoint: EndpointProtocol, mapper: M.Type). Use given")
			Failure("Stub return value not specified for perform<M: MapperProtocol>(endpoint: EndpointProtocol, mapper: M.Type). Use given")
		}
		return __value
    }

    open func perform<M: MapperProtocol>(endpoint: EndpointProtocol, arrayMapper: M.Type) -> AnyPublisher<[M.Output], Error> where M.Input: Decodable {
        addInvocation(.m_perform__endpoint_endpointarrayMapper_arrayMapper(Parameter<EndpointProtocol>.value(`endpoint`), Parameter<M.Type>.value(`arrayMapper`).wrapAsGeneric()))
		let perform = methodPerformValue(.m_perform__endpoint_endpointarrayMapper_arrayMapper(Parameter<EndpointProtocol>.value(`endpoint`), Parameter<M.Type>.value(`arrayMapper`).wrapAsGeneric())) as? (EndpointProtocol, M.Type) -> Void
		perform?(`endpoint`, `arrayMapper`)
		var __value: AnyPublisher<[M.Output], Error>
		do {
		    __value = try methodReturnValue(.m_perform__endpoint_endpointarrayMapper_arrayMapper(Parameter<EndpointProtocol>.value(`endpoint`), Parameter<M.Type>.value(`arrayMapper`).wrapAsGeneric())).casted()
		} catch {
			onFatalFailure("Stub return value not specified for perform<M: MapperProtocol>(endpoint: EndpointProtocol, arrayMapper: M.Type). Use given")
			Failure("Stub return value not specified for perform<M: MapperProtocol>(endpoint: EndpointProtocol, arrayMapper: M.Type). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_perform__endpoint_endpointwaitsUntilConnected_waitsUntilConnected(Parameter<EndpointProtocol>, Parameter<Bool>)
        case m_perform__endpoint_endpointmapper_mapperwaitsUntilConnected_waitsUntilConnected(Parameter<EndpointProtocol>, Parameter<GenericAttribute>, Parameter<Bool>)
        case m_perform__endpoint_endpointarrayMapper_arrayMapperwaitsUntilConnected_waitsUntilConnected(Parameter<EndpointProtocol>, Parameter<GenericAttribute>, Parameter<Bool>)
        case m_perform__endpoint_endpointmapper_mapper(Parameter<EndpointProtocol>, Parameter<GenericAttribute>)
        case m_perform__endpoint_endpointarrayMapper_arrayMapper(Parameter<EndpointProtocol>, Parameter<GenericAttribute>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_perform__endpoint_endpointwaitsUntilConnected_waitsUntilConnected(let lhsEndpoint, let lhsWaitsuntilconnected), .m_perform__endpoint_endpointwaitsUntilConnected_waitsUntilConnected(let rhsEndpoint, let rhsWaitsuntilconnected)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsEndpoint, rhs: rhsEndpoint, with: matcher), lhsEndpoint, rhsEndpoint, "endpoint"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsWaitsuntilconnected, rhs: rhsWaitsuntilconnected, with: matcher), lhsWaitsuntilconnected, rhsWaitsuntilconnected, "waitsUntilConnected"))
				return Matcher.ComparisonResult(results)

            case (.m_perform__endpoint_endpointmapper_mapperwaitsUntilConnected_waitsUntilConnected(let lhsEndpoint, let lhsMapper, let lhsWaitsuntilconnected), .m_perform__endpoint_endpointmapper_mapperwaitsUntilConnected_waitsUntilConnected(let rhsEndpoint, let rhsMapper, let rhsWaitsuntilconnected)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsEndpoint, rhs: rhsEndpoint, with: matcher), lhsEndpoint, rhsEndpoint, "endpoint"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMapper, rhs: rhsMapper, with: matcher), lhsMapper, rhsMapper, "mapper"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsWaitsuntilconnected, rhs: rhsWaitsuntilconnected, with: matcher), lhsWaitsuntilconnected, rhsWaitsuntilconnected, "waitsUntilConnected"))
				return Matcher.ComparisonResult(results)

            case (.m_perform__endpoint_endpointarrayMapper_arrayMapperwaitsUntilConnected_waitsUntilConnected(let lhsEndpoint, let lhsArraymapper, let lhsWaitsuntilconnected), .m_perform__endpoint_endpointarrayMapper_arrayMapperwaitsUntilConnected_waitsUntilConnected(let rhsEndpoint, let rhsArraymapper, let rhsWaitsuntilconnected)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsEndpoint, rhs: rhsEndpoint, with: matcher), lhsEndpoint, rhsEndpoint, "endpoint"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsArraymapper, rhs: rhsArraymapper, with: matcher), lhsArraymapper, rhsArraymapper, "arrayMapper"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsWaitsuntilconnected, rhs: rhsWaitsuntilconnected, with: matcher), lhsWaitsuntilconnected, rhsWaitsuntilconnected, "waitsUntilConnected"))
				return Matcher.ComparisonResult(results)

            case (.m_perform__endpoint_endpointmapper_mapper(let lhsEndpoint, let lhsMapper), .m_perform__endpoint_endpointmapper_mapper(let rhsEndpoint, let rhsMapper)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsEndpoint, rhs: rhsEndpoint, with: matcher), lhsEndpoint, rhsEndpoint, "endpoint"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsMapper, rhs: rhsMapper, with: matcher), lhsMapper, rhsMapper, "mapper"))
				return Matcher.ComparisonResult(results)

            case (.m_perform__endpoint_endpointarrayMapper_arrayMapper(let lhsEndpoint, let lhsArraymapper), .m_perform__endpoint_endpointarrayMapper_arrayMapper(let rhsEndpoint, let rhsArraymapper)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsEndpoint, rhs: rhsEndpoint, with: matcher), lhsEndpoint, rhsEndpoint, "endpoint"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsArraymapper, rhs: rhsArraymapper, with: matcher), lhsArraymapper, rhsArraymapper, "arrayMapper"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_perform__endpoint_endpointwaitsUntilConnected_waitsUntilConnected(p0, p1): return p0.intValue + p1.intValue
            case let .m_perform__endpoint_endpointmapper_mapperwaitsUntilConnected_waitsUntilConnected(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
            case let .m_perform__endpoint_endpointarrayMapper_arrayMapperwaitsUntilConnected_waitsUntilConnected(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
            case let .m_perform__endpoint_endpointmapper_mapper(p0, p1): return p0.intValue + p1.intValue
            case let .m_perform__endpoint_endpointarrayMapper_arrayMapper(p0, p1): return p0.intValue + p1.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_perform__endpoint_endpointwaitsUntilConnected_waitsUntilConnected: return ".perform(endpoint:waitsUntilConnected:)"
            case .m_perform__endpoint_endpointmapper_mapperwaitsUntilConnected_waitsUntilConnected: return ".perform(endpoint:mapper:waitsUntilConnected:)"
            case .m_perform__endpoint_endpointarrayMapper_arrayMapperwaitsUntilConnected_waitsUntilConnected: return ".perform(endpoint:arrayMapper:waitsUntilConnected:)"
            case .m_perform__endpoint_endpointmapper_mapper: return ".perform(endpoint:mapper:)"
            case .m_perform__endpoint_endpointarrayMapper_arrayMapper: return ".perform(endpoint:arrayMapper:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func perform(endpoint: Parameter<EndpointProtocol>, waitsUntilConnected: Parameter<Bool>, willReturn: AnyPublisher<Void, Error>...) -> MethodStub {
            return Given(method: .m_perform__endpoint_endpointwaitsUntilConnected_waitsUntilConnected(`endpoint`, `waitsUntilConnected`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func perform<M: MapperProtocol>(endpoint: Parameter<EndpointProtocol>, mapper: Parameter<M.Type>, waitsUntilConnected: Parameter<Bool>, willReturn: AnyPublisher<M.Output, Error>...) -> MethodStub where M.Input: Decodable {
            return Given(method: .m_perform__endpoint_endpointmapper_mapperwaitsUntilConnected_waitsUntilConnected(`endpoint`, `mapper`.wrapAsGeneric(), `waitsUntilConnected`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func perform<M: MapperProtocol>(endpoint: Parameter<EndpointProtocol>, arrayMapper: Parameter<M.Type>, waitsUntilConnected: Parameter<Bool>, willReturn: AnyPublisher<[M.Output], Error>...) -> MethodStub where M.Input: Decodable {
            return Given(method: .m_perform__endpoint_endpointarrayMapper_arrayMapperwaitsUntilConnected_waitsUntilConnected(`endpoint`, `arrayMapper`.wrapAsGeneric(), `waitsUntilConnected`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func perform<M: MapperProtocol>(endpoint: Parameter<EndpointProtocol>, mapper: Parameter<M.Type>, willReturn: AnyPublisher<M.Output, Error>...) -> MethodStub where M.Input: Decodable {
            return Given(method: .m_perform__endpoint_endpointmapper_mapper(`endpoint`, `mapper`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func perform<M: MapperProtocol>(endpoint: Parameter<EndpointProtocol>, arrayMapper: Parameter<M.Type>, willReturn: AnyPublisher<[M.Output], Error>...) -> MethodStub where M.Input: Decodable {
            return Given(method: .m_perform__endpoint_endpointarrayMapper_arrayMapper(`endpoint`, `arrayMapper`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func perform(endpoint: Parameter<EndpointProtocol>, waitsUntilConnected: Parameter<Bool>, willProduce: (Stubber<AnyPublisher<Void, Error>>) -> Void) -> MethodStub {
            let willReturn: [AnyPublisher<Void, Error>] = []
			let given: Given = { return Given(method: .m_perform__endpoint_endpointwaitsUntilConnected_waitsUntilConnected(`endpoint`, `waitsUntilConnected`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (AnyPublisher<Void, Error>).self)
			willProduce(stubber)
			return given
        }
        public static func perform<M: MapperProtocol>(endpoint: Parameter<EndpointProtocol>, mapper: Parameter<M.Type>, waitsUntilConnected: Parameter<Bool>, willProduce: (Stubber<AnyPublisher<M.Output, Error>>) -> Void) -> MethodStub where M.Input: Decodable {
            let willReturn: [AnyPublisher<M.Output, Error>] = []
			let given: Given = { return Given(method: .m_perform__endpoint_endpointmapper_mapperwaitsUntilConnected_waitsUntilConnected(`endpoint`, `mapper`.wrapAsGeneric(), `waitsUntilConnected`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (AnyPublisher<M.Output, Error>).self)
			willProduce(stubber)
			return given
        }
        public static func perform<M: MapperProtocol>(endpoint: Parameter<EndpointProtocol>, arrayMapper: Parameter<M.Type>, waitsUntilConnected: Parameter<Bool>, willProduce: (Stubber<AnyPublisher<[M.Output], Error>>) -> Void) -> MethodStub where M.Input: Decodable {
            let willReturn: [AnyPublisher<[M.Output], Error>] = []
			let given: Given = { return Given(method: .m_perform__endpoint_endpointarrayMapper_arrayMapperwaitsUntilConnected_waitsUntilConnected(`endpoint`, `arrayMapper`.wrapAsGeneric(), `waitsUntilConnected`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (AnyPublisher<[M.Output], Error>).self)
			willProduce(stubber)
			return given
        }
        public static func perform<M: MapperProtocol>(endpoint: Parameter<EndpointProtocol>, mapper: Parameter<M.Type>, willProduce: (Stubber<AnyPublisher<M.Output, Error>>) -> Void) -> MethodStub where M.Input: Decodable {
            let willReturn: [AnyPublisher<M.Output, Error>] = []
			let given: Given = { return Given(method: .m_perform__endpoint_endpointmapper_mapper(`endpoint`, `mapper`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (AnyPublisher<M.Output, Error>).self)
			willProduce(stubber)
			return given
        }
        public static func perform<M: MapperProtocol>(endpoint: Parameter<EndpointProtocol>, arrayMapper: Parameter<M.Type>, willProduce: (Stubber<AnyPublisher<[M.Output], Error>>) -> Void) -> MethodStub where M.Input: Decodable {
            let willReturn: [AnyPublisher<[M.Output], Error>] = []
			let given: Given = { return Given(method: .m_perform__endpoint_endpointarrayMapper_arrayMapper(`endpoint`, `arrayMapper`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (AnyPublisher<[M.Output], Error>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func perform(endpoint: Parameter<EndpointProtocol>, waitsUntilConnected: Parameter<Bool>) -> Verify { return Verify(method: .m_perform__endpoint_endpointwaitsUntilConnected_waitsUntilConnected(`endpoint`, `waitsUntilConnected`))}
        public static func perform<M>(endpoint: Parameter<EndpointProtocol>, mapper: Parameter<M.Type>, waitsUntilConnected: Parameter<Bool>) -> Verify where M:MapperProtocol { return Verify(method: .m_perform__endpoint_endpointmapper_mapperwaitsUntilConnected_waitsUntilConnected(`endpoint`, `mapper`.wrapAsGeneric(), `waitsUntilConnected`))}
        public static func perform<M>(endpoint: Parameter<EndpointProtocol>, arrayMapper: Parameter<M.Type>, waitsUntilConnected: Parameter<Bool>) -> Verify where M:MapperProtocol { return Verify(method: .m_perform__endpoint_endpointarrayMapper_arrayMapperwaitsUntilConnected_waitsUntilConnected(`endpoint`, `arrayMapper`.wrapAsGeneric(), `waitsUntilConnected`))}
        public static func perform<M>(endpoint: Parameter<EndpointProtocol>, mapper: Parameter<M.Type>) -> Verify where M:MapperProtocol { return Verify(method: .m_perform__endpoint_endpointmapper_mapper(`endpoint`, `mapper`.wrapAsGeneric()))}
        public static func perform<M>(endpoint: Parameter<EndpointProtocol>, arrayMapper: Parameter<M.Type>) -> Verify where M:MapperProtocol { return Verify(method: .m_perform__endpoint_endpointarrayMapper_arrayMapper(`endpoint`, `arrayMapper`.wrapAsGeneric()))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func perform(endpoint: Parameter<EndpointProtocol>, waitsUntilConnected: Parameter<Bool>, perform: @escaping (EndpointProtocol, Bool) -> Void) -> Perform {
            return Perform(method: .m_perform__endpoint_endpointwaitsUntilConnected_waitsUntilConnected(`endpoint`, `waitsUntilConnected`), performs: perform)
        }
        public static func perform<M>(endpoint: Parameter<EndpointProtocol>, mapper: Parameter<M.Type>, waitsUntilConnected: Parameter<Bool>, perform: @escaping (EndpointProtocol, M.Type, Bool) -> Void) -> Perform where M:MapperProtocol {
            return Perform(method: .m_perform__endpoint_endpointmapper_mapperwaitsUntilConnected_waitsUntilConnected(`endpoint`, `mapper`.wrapAsGeneric(), `waitsUntilConnected`), performs: perform)
        }
        public static func perform<M>(endpoint: Parameter<EndpointProtocol>, arrayMapper: Parameter<M.Type>, waitsUntilConnected: Parameter<Bool>, perform: @escaping (EndpointProtocol, M.Type, Bool) -> Void) -> Perform where M:MapperProtocol {
            return Perform(method: .m_perform__endpoint_endpointarrayMapper_arrayMapperwaitsUntilConnected_waitsUntilConnected(`endpoint`, `arrayMapper`.wrapAsGeneric(), `waitsUntilConnected`), performs: perform)
        }
        public static func perform<M>(endpoint: Parameter<EndpointProtocol>, mapper: Parameter<M.Type>, perform: @escaping (EndpointProtocol, M.Type) -> Void) -> Perform where M:MapperProtocol {
            return Perform(method: .m_perform__endpoint_endpointmapper_mapper(`endpoint`, `mapper`.wrapAsGeneric()), performs: perform)
        }
        public static func perform<M>(endpoint: Parameter<EndpointProtocol>, arrayMapper: Parameter<M.Type>, perform: @escaping (EndpointProtocol, M.Type) -> Void) -> Perform where M:MapperProtocol {
            return Perform(method: .m_perform__endpoint_endpointarrayMapper_arrayMapper(`endpoint`, `arrayMapper`.wrapAsGeneric()), performs: perform)
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

// MARK: - UserDefaultsWrapperProtocol

open class UserDefaultsWrapperProtocolMock: UserDefaultsWrapperProtocol, Mock {
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





    open func getValue<T>(forKey key: UserDefaultsKey) -> T? {
        addInvocation(.m_getValue__forKey_key(Parameter<UserDefaultsKey>.value(`key`)))
		let perform = methodPerformValue(.m_getValue__forKey_key(Parameter<UserDefaultsKey>.value(`key`))) as? (UserDefaultsKey) -> Void
		perform?(`key`)
		var __value: T? = nil
		do {
		    __value = try methodReturnValue(.m_getValue__forKey_key(Parameter<UserDefaultsKey>.value(`key`))).casted()
		} catch {
			// do nothing
		}
		return __value
    }

    open func getValue<T>(forKey key: UserDefaultsKey, defaultValue: T) -> T {
        addInvocation(.m_getValue__forKey_keydefaultValue_defaultValue(Parameter<UserDefaultsKey>.value(`key`), Parameter<T>.value(`defaultValue`).wrapAsGeneric()))
		let perform = methodPerformValue(.m_getValue__forKey_keydefaultValue_defaultValue(Parameter<UserDefaultsKey>.value(`key`), Parameter<T>.value(`defaultValue`).wrapAsGeneric())) as? (UserDefaultsKey, T) -> Void
		perform?(`key`, `defaultValue`)
		var __value: T
		do {
		    __value = try methodReturnValue(.m_getValue__forKey_keydefaultValue_defaultValue(Parameter<UserDefaultsKey>.value(`key`), Parameter<T>.value(`defaultValue`).wrapAsGeneric())).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getValue<T>(forKey key: UserDefaultsKey, defaultValue: T). Use given")
			Failure("Stub return value not specified for getValue<T>(forKey key: UserDefaultsKey, defaultValue: T). Use given")
		}
		return __value
    }

    open func setValue<T>(_ newValue: T, forKey key: UserDefaultsKey) {
        addInvocation(.m_setValue__newValueforKey_key(Parameter<T>.value(`newValue`).wrapAsGeneric(), Parameter<UserDefaultsKey>.value(`key`)))
		let perform = methodPerformValue(.m_setValue__newValueforKey_key(Parameter<T>.value(`newValue`).wrapAsGeneric(), Parameter<UserDefaultsKey>.value(`key`))) as? (T, UserDefaultsKey) -> Void
		perform?(`newValue`, `key`)
    }

    open func setData<T: Encodable>(_ newValue: T, forKey key: UserDefaultsKey) {
        addInvocation(.m_setData__newValueforKey_key(Parameter<T>.value(`newValue`).wrapAsGeneric(), Parameter<UserDefaultsKey>.value(`key`)))
		let perform = methodPerformValue(.m_setData__newValueforKey_key(Parameter<T>.value(`newValue`).wrapAsGeneric(), Parameter<UserDefaultsKey>.value(`key`))) as? (T, UserDefaultsKey) -> Void
		perform?(`newValue`, `key`)
    }

    open func getData<T: Decodable>(forKey key: UserDefaultsKey, defaultValue: T) -> T {
        addInvocation(.m_getData__forKey_keydefaultValue_defaultValue(Parameter<UserDefaultsKey>.value(`key`), Parameter<T>.value(`defaultValue`).wrapAsGeneric()))
		let perform = methodPerformValue(.m_getData__forKey_keydefaultValue_defaultValue(Parameter<UserDefaultsKey>.value(`key`), Parameter<T>.value(`defaultValue`).wrapAsGeneric())) as? (UserDefaultsKey, T) -> Void
		perform?(`key`, `defaultValue`)
		var __value: T
		do {
		    __value = try methodReturnValue(.m_getData__forKey_keydefaultValue_defaultValue(Parameter<UserDefaultsKey>.value(`key`), Parameter<T>.value(`defaultValue`).wrapAsGeneric())).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getData<T: Decodable>(forKey key: UserDefaultsKey, defaultValue: T). Use given")
			Failure("Stub return value not specified for getData<T: Decodable>(forKey key: UserDefaultsKey, defaultValue: T). Use given")
		}
		return __value
    }

    open func removeObject(forKey key: UserDefaultsKey) {
        addInvocation(.m_removeObject__forKey_key(Parameter<UserDefaultsKey>.value(`key`)))
		let perform = methodPerformValue(.m_removeObject__forKey_key(Parameter<UserDefaultsKey>.value(`key`))) as? (UserDefaultsKey) -> Void
		perform?(`key`)
    }


    fileprivate enum MethodType {
        case m_getValue__forKey_key(Parameter<UserDefaultsKey>)
        case m_getValue__forKey_keydefaultValue_defaultValue(Parameter<UserDefaultsKey>, Parameter<GenericAttribute>)
        case m_setValue__newValueforKey_key(Parameter<GenericAttribute>, Parameter<UserDefaultsKey>)
        case m_setData__newValueforKey_key(Parameter<GenericAttribute>, Parameter<UserDefaultsKey>)
        case m_getData__forKey_keydefaultValue_defaultValue(Parameter<UserDefaultsKey>, Parameter<GenericAttribute>)
        case m_removeObject__forKey_key(Parameter<UserDefaultsKey>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getValue__forKey_key(let lhsKey), .m_getValue__forKey_key(let rhsKey)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsKey, rhs: rhsKey, with: matcher), lhsKey, rhsKey, "forKey key"))
				return Matcher.ComparisonResult(results)

            case (.m_getValue__forKey_keydefaultValue_defaultValue(let lhsKey, let lhsDefaultvalue), .m_getValue__forKey_keydefaultValue_defaultValue(let rhsKey, let rhsDefaultvalue)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsKey, rhs: rhsKey, with: matcher), lhsKey, rhsKey, "forKey key"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsDefaultvalue, rhs: rhsDefaultvalue, with: matcher), lhsDefaultvalue, rhsDefaultvalue, "defaultValue"))
				return Matcher.ComparisonResult(results)

            case (.m_setValue__newValueforKey_key(let lhsNewvalue, let lhsKey), .m_setValue__newValueforKey_key(let rhsNewvalue, let rhsKey)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsNewvalue, rhs: rhsNewvalue, with: matcher), lhsNewvalue, rhsNewvalue, "_ newValue"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsKey, rhs: rhsKey, with: matcher), lhsKey, rhsKey, "forKey key"))
				return Matcher.ComparisonResult(results)

            case (.m_setData__newValueforKey_key(let lhsNewvalue, let lhsKey), .m_setData__newValueforKey_key(let rhsNewvalue, let rhsKey)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsNewvalue, rhs: rhsNewvalue, with: matcher), lhsNewvalue, rhsNewvalue, "_ newValue"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsKey, rhs: rhsKey, with: matcher), lhsKey, rhsKey, "forKey key"))
				return Matcher.ComparisonResult(results)

            case (.m_getData__forKey_keydefaultValue_defaultValue(let lhsKey, let lhsDefaultvalue), .m_getData__forKey_keydefaultValue_defaultValue(let rhsKey, let rhsDefaultvalue)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsKey, rhs: rhsKey, with: matcher), lhsKey, rhsKey, "forKey key"))
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsDefaultvalue, rhs: rhsDefaultvalue, with: matcher), lhsDefaultvalue, rhsDefaultvalue, "defaultValue"))
				return Matcher.ComparisonResult(results)

            case (.m_removeObject__forKey_key(let lhsKey), .m_removeObject__forKey_key(let rhsKey)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsKey, rhs: rhsKey, with: matcher), lhsKey, rhsKey, "forKey key"))
				return Matcher.ComparisonResult(results)
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_getValue__forKey_key(p0): return p0.intValue
            case let .m_getValue__forKey_keydefaultValue_defaultValue(p0, p1): return p0.intValue + p1.intValue
            case let .m_setValue__newValueforKey_key(p0, p1): return p0.intValue + p1.intValue
            case let .m_setData__newValueforKey_key(p0, p1): return p0.intValue + p1.intValue
            case let .m_getData__forKey_keydefaultValue_defaultValue(p0, p1): return p0.intValue + p1.intValue
            case let .m_removeObject__forKey_key(p0): return p0.intValue
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getValue__forKey_key: return ".getValue(forKey:)"
            case .m_getValue__forKey_keydefaultValue_defaultValue: return ".getValue(forKey:defaultValue:)"
            case .m_setValue__newValueforKey_key: return ".setValue(_:forKey:)"
            case .m_setData__newValueforKey_key: return ".setData(_:forKey:)"
            case .m_getData__forKey_keydefaultValue_defaultValue: return ".getData(forKey:defaultValue:)"
            case .m_removeObject__forKey_key: return ".removeObject(forKey:)"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getValue<T>(forKey key: Parameter<UserDefaultsKey>, willReturn: T?...) -> MethodStub {
            return Given(method: .m_getValue__forKey_key(`key`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getValue<T>(forKey key: Parameter<UserDefaultsKey>, defaultValue: Parameter<T>, willReturn: T...) -> MethodStub {
            return Given(method: .m_getValue__forKey_keydefaultValue_defaultValue(`key`, `defaultValue`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getData<T: Decodable>(forKey key: Parameter<UserDefaultsKey>, defaultValue: Parameter<T>, willReturn: T...) -> MethodStub {
            return Given(method: .m_getData__forKey_keydefaultValue_defaultValue(`key`, `defaultValue`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getValue<T>(forKey key: Parameter<UserDefaultsKey>, willProduce: (Stubber<T?>) -> Void) -> MethodStub {
            let willReturn: [T?] = []
			let given: Given = { return Given(method: .m_getValue__forKey_key(`key`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (T?).self)
			willProduce(stubber)
			return given
        }
        public static func getValue<T>(forKey key: Parameter<UserDefaultsKey>, defaultValue: Parameter<T>, willProduce: (Stubber<T>) -> Void) -> MethodStub {
            let willReturn: [T] = []
			let given: Given = { return Given(method: .m_getValue__forKey_keydefaultValue_defaultValue(`key`, `defaultValue`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (T).self)
			willProduce(stubber)
			return given
        }
        public static func getData<T: Decodable>(forKey key: Parameter<UserDefaultsKey>, defaultValue: Parameter<T>, willProduce: (Stubber<T>) -> Void) -> MethodStub {
            let willReturn: [T] = []
			let given: Given = { return Given(method: .m_getData__forKey_keydefaultValue_defaultValue(`key`, `defaultValue`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (T).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getValue(forKey key: Parameter<UserDefaultsKey>) -> Verify { return Verify(method: .m_getValue__forKey_key(`key`))}
        public static func getValue<T>(forKey key: Parameter<UserDefaultsKey>, defaultValue: Parameter<T>) -> Verify { return Verify(method: .m_getValue__forKey_keydefaultValue_defaultValue(`key`, `defaultValue`.wrapAsGeneric()))}
        public static func setValue<T>(_ newValue: Parameter<T>, forKey key: Parameter<UserDefaultsKey>) -> Verify { return Verify(method: .m_setValue__newValueforKey_key(`newValue`.wrapAsGeneric(), `key`))}
        public static func setData<T>(_ newValue: Parameter<T>, forKey key: Parameter<UserDefaultsKey>) -> Verify where T:Encodable { return Verify(method: .m_setData__newValueforKey_key(`newValue`.wrapAsGeneric(), `key`))}
        public static func getData<T>(forKey key: Parameter<UserDefaultsKey>, defaultValue: Parameter<T>) -> Verify where T:Decodable { return Verify(method: .m_getData__forKey_keydefaultValue_defaultValue(`key`, `defaultValue`.wrapAsGeneric()))}
        public static func removeObject(forKey key: Parameter<UserDefaultsKey>) -> Verify { return Verify(method: .m_removeObject__forKey_key(`key`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getValue(forKey key: Parameter<UserDefaultsKey>, perform: @escaping (UserDefaultsKey) -> Void) -> Perform {
            return Perform(method: .m_getValue__forKey_key(`key`), performs: perform)
        }
        public static func getValue<T>(forKey key: Parameter<UserDefaultsKey>, defaultValue: Parameter<T>, perform: @escaping (UserDefaultsKey, T) -> Void) -> Perform {
            return Perform(method: .m_getValue__forKey_keydefaultValue_defaultValue(`key`, `defaultValue`.wrapAsGeneric()), performs: perform)
        }
        public static func setValue<T>(_ newValue: Parameter<T>, forKey key: Parameter<UserDefaultsKey>, perform: @escaping (T, UserDefaultsKey) -> Void) -> Perform {
            return Perform(method: .m_setValue__newValueforKey_key(`newValue`.wrapAsGeneric(), `key`), performs: perform)
        }
        public static func setData<T>(_ newValue: Parameter<T>, forKey key: Parameter<UserDefaultsKey>, perform: @escaping (T, UserDefaultsKey) -> Void) -> Perform where T:Encodable {
            return Perform(method: .m_setData__newValueforKey_key(`newValue`.wrapAsGeneric(), `key`), performs: perform)
        }
        public static func getData<T>(forKey key: Parameter<UserDefaultsKey>, defaultValue: Parameter<T>, perform: @escaping (UserDefaultsKey, T) -> Void) -> Perform where T:Decodable {
            return Perform(method: .m_getData__forKey_keydefaultValue_defaultValue(`key`, `defaultValue`.wrapAsGeneric()), performs: perform)
        }
        public static func removeObject(forKey key: Parameter<UserDefaultsKey>, perform: @escaping (UserDefaultsKey) -> Void) -> Perform {
            return Perform(method: .m_removeObject__forKey_key(`key`), performs: perform)
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


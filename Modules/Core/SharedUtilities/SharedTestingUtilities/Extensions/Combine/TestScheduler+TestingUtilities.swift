//
//  TestScheduler+TestingUtilities.swift
//  SharedTestingUtilities
//
//  Created by Aitor Salvador on 13/2/22.
//

import Combine

public extension TestScheduler {
    func scheduleSuccessPublisher<Data>(atVirtualTime time: SchedulerTimeType.Stride,
                                        returnedData: Data) -> PublisherResult<Data> {
        FutureResult { callback in
            self.schedule(after: self.now.advanced(by: time)) {
                callback(.success(returnedData))
            }
        }.eraseToAnyPublisher()
    }

    func scheduleErrorPublisher<Data>(
        atVirtualTime time: SchedulerTimeType.Stride,
        dataType: Data.Type,
        error: Error
    ) -> PublisherResult<Data> {
        FutureResult { callback in
            self.schedule(after: self.now.advanced(by: time)) {
                callback(.failure(error))
            }
        }.eraseToAnyPublisher()
    }
}

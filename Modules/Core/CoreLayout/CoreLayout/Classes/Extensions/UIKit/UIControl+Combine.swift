//
//  UIControl+Combine.swift
//  PlayerKit
//
//  Created by Aitor Salvador García on 14/11/21.
//

import UIKit
import Combine

public extension UIControl {
    func publisher(
        for event: UIControl.Event
    ) -> UIControl.EventControlPublisher {
        .init(
            control: self,
            controlEvent: event
        )
    }
}

extension UIControl {
    fileprivate class EventControlSubscription<
        EventSubscriber: Subscriber
    >: NSObject, Subscription
    where
    EventSubscriber.Input == UIControl,
    EventSubscriber.Failure == Never
    {
        
        let control: UIControl
        let event: UIControl.Event
        var subscriber: EventSubscriber?
        
        var currentDemand: Subscribers.Demand = .none
        
        init(
            control: UIControl,
            event: UIControl.Event,
            subscriber: EventSubscriber
        ) {
            self.control = control
            self.event = event
            self.subscriber = subscriber
            super.init()
            
            control.addTarget(self,
                              action: #selector(eventRaised),
                              for: event)
        }
        
        func request(_ demand: Subscribers.Demand) {
            currentDemand += demand
        }
        
        func cancel() {
            subscriber = nil
            control.removeTarget(self,
                                 action: #selector(eventRaised),
                                 for: event)
        }
        
        @objc func eventRaised() {
            if currentDemand > 0 {
                currentDemand += subscriber?.receive(control) ?? .none
                currentDemand -= 1
            }
        }
    }
}

extension UIControl {
    public class EventControlPublisher: NSObject, Publisher {
        public typealias Output = UIControl
        public typealias Failure = Never
        
        private let control: UIControl
        private let controlEvent: UIControl.Event

        init(control: UIControl,
             controlEvent: UIControl.Event = []) {
            self.control = control
            self.controlEvent = controlEvent
            super.init()
        }
        
        public func receive<S>(subscriber: S)
        where S : Subscriber,
              Failure == S.Failure,
              Output == S.Input {
                  // instantiate the new subscription
                  let subscription = EventControlSubscription(
                    control: control,
                    event: controlEvent,
                    subscriber: subscriber
                  )
                  // tell the subscriber that it has successfully subscribed to the publisher
                  subscriber.receive(subscription: subscription)
              }
    }
}

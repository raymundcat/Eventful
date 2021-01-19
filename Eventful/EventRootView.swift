//
//  EventRootView.swift
//  Minority
//
//  Created by Raymund Catahay on 2019-08-09.
//

import UIKit
import MulticastDelegate

public protocol ViewEvent: Event { }

public protocol ViewEventListener: class {
    func view(didSend event: ViewEvent)
}

open class EventRootView<ViewEventType: ViewEvent, PresentableEventType: PresentableEvent>: UIView, PresentableEventListener {

    // MARK: Sending Events

    public var eventListeners = MulticastDelegate<ViewEventListener>()

    open func send(event: ViewEvent) {
        eventListeners.invokeDelegates { (delegate) in
            delegate.view(didSend: event)
        }
    }

    open func send(event: ViewEventType) {
        eventListeners.invokeDelegates { (delegate) in
            delegate.view(didSend: event)
        }
    }

    // MARK: Event Catching

    open func presenter(didSend event: PresentableEvent) {
        if let presenterEvent = event as? PresentableEventType {
            self.presenter(didSend: presenterEvent)
        }
    }

    // MARK: Generic Event Catching

    open func presenter(didSend event: PresentableEventType) { }
}

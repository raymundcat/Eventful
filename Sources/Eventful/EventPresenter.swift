//
//  EventPresenter.swift
//  Minority
//
//  Created by Raymund Catahay on 2019-08-09.
//

import UIKit
import MulticastDelegate

public protocol PresenterEvent: Event { }

public protocol PresentableEvent: Event { }

public protocol PresenterEventListener: class {
    func presenter(didSend event: PresenterEvent)
}

public protocol PresentableEventListener: class {
    func presenter(didSend event: PresentableEvent)
}

open class EventPresenter<ViewEventType: ViewEvent, PresenterEventType: PresenterEvent, PresentableEventType: PresentableEvent>: ViewEventListener {

    public init() { }
    
    // Events Sending

    public var eventListeners = MulticastDelegate<PresenterEventListener>()

    public var presentables = MulticastDelegate<PresentableEventListener>()

    open func send(event: PresenterEventType) {
        eventListeners.invokeDelegates { (delegate) in
            delegate.presenter(didSend: event)
        }
    }

    open func send(event: PresentableEventType) {
        presentables.invokeDelegates { (delegate) in
            delegate.presenter(didSend: event)
        }
    }

    // Events Catching

    open func view(didSend event: ViewEvent) {
        if let viewEvent = event as? ViewEventType {
            self.view(didSend: viewEvent)
        }
    }

    // Generic Events Catching

    open func view(didSend event: ViewEventType) { }
}

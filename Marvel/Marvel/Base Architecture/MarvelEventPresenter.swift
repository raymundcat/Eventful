//
//  MarvelEventPresenter.swift
//  Marvel
//
//  Created by Raymund Catahay on 2021-01-18.
//

import Foundation
import Eventful
import MulticastDelegate

public enum MarvelCorePresentableEvent: PresentableEvent {

    case shouldShowLoading(Bool)
    case showAlert(title: String?, message: String)
}

public protocol MarvelCorePresentableEventListener: class {
    
    func presenter(didSend event: MarvelCorePresentableEvent)
}

open class MarvelPresenter<MarvelViewEvent: ViewEvent, MarvelPresenterEvent: PresenterEvent, MarvelPresentableEvent: PresentableEvent>: EventPresenter<MarvelViewEvent, MarvelPresenterEvent, MarvelPresentableEvent>, MarvelViewControllerEventListener {
    
    //MARK: Events Sending
    
    public var corePresentableEventListeners = MulticastDelegate<MarvelCorePresentableEventListener>()
    
    open func send(event: MarvelCorePresentableEvent) {
        corePresentableEventListeners.invokeDelegates { (delegate) in
            delegate.presenter(didSend: event)
        }
    }
    
    //MARK: Events Catching
    
    override open func view(didSend event: ViewEvent) {
        if let viewEvent = event as? MarvelViewEvent {
            self.view(didSend: viewEvent)
        }
    }

    // Generic Events Catching

    open override func view(didSend event: MarvelViewEvent) { }
    
    open func viewController(didSend event: MarvelViewControllerEvent) { }
}

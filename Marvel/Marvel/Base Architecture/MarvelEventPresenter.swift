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
    
    open func viewController(didSend event: MarvelViewControllerEvent) {
        
    }
}

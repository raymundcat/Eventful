//
//  MarvelEventRootView.swift
//  Marvel
//
//  Created by Raymund Catahay on 2021-01-18.
//

import Foundation
import Eventful

open class MarvelRootView<MarvelViewEvent: ViewEvent, MarvelPresentableEvent: PresentableEvent>: EventRootView<MarvelViewEvent, MarvelPresentableEvent>, MarvelViewControllerEventListener, MarvelCorePresentableEventListener {
    
    //MARK: Events Catching
    
    open override func presenter(didSend event: PresentableEvent) {
        if let presenterEvent = event as? MarvelPresentableEvent {
            self.presenter(didSend: presenterEvent)
        }
    }

    // MARK: Generic Event Catching

    open override func presenter(didSend event: MarvelPresentableEvent) { }
    
    open func viewController(didSend event: MarvelViewControllerEvent) { }
    
    public func presenter(didSend event: MarvelCorePresentableEvent) { }
}

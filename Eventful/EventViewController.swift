//
//  EventViewController Plus.swift
//  Minority
//
//  Created by Raymund Catahay on 2019-10-01.
//

import UIKit
import MulticastDelegate

open class EventViewController<ViewEventType: ViewEvent, PresenterEventType: PresenterEvent, PresentableEventType: PresentableEvent>: UIViewController, PresenterEventListener {

    //MARK: Coordinator Requirements

    open lazy var rootPresenter: EventPresenter<ViewEventType, PresenterEventType, PresentableEventType> = preparePresenter()
    
    open lazy var rootView: EventRootView<ViewEventType, PresentableEventType> = prepareRootView()
    
    open func preparePresenter() -> EventPresenter<ViewEventType, PresenterEventType, PresentableEventType> {
        return EventPresenter<ViewEventType, PresenterEventType, PresentableEventType>()
    }
    
    open func prepareRootView() -> EventRootView<ViewEventType, PresentableEventType>  {
        return EventRootView<ViewEventType, PresentableEventType>()
    }

    //MARK: Life Cycle
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        setupBindings()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Bindings
    
    open func setupBindings() {
//        observeKeyboardEvents()
            
        // Presenter Events
        rootPresenter.eventListeners.addDelegate(self)
        rootPresenter.presentables.addDelegate(rootView)

//        // ViewController Events
//        viewControllerEventListeners.addDelegate(rootView)
//        viewControllerEventListeners.addDelegate(rootPresenter)

        // RootView Events
        rootView.eventListeners.addDelegate(rootPresenter)
    }

    //MARK: Events Listening

    open func presenter(didSend event: PresenterEvent) {
        if let presenterEvent = event as? PresenterEventType {
            self.presenter(didSend: presenterEvent)
        }
    }

    open func presenter(didSend event: PresenterEventType) { }
}

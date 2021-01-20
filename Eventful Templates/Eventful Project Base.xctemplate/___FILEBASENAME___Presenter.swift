//___FILEHEADER___

import Foundation
import Eventful
import MulticastDelegate

public enum ___VARIABLE_moduleName___CorePresentableEvent: PresentableEvent {

    case shouldShowLoading(Bool)
    case showAlert(title: String?, message: String)
}

public protocol ___VARIABLE_moduleName___CorePresentableEventListener: class {
    
    func presenter(didSend event: ___VARIABLE_moduleName___CorePresentableEvent)
}

open class ___VARIABLE_moduleName___Presenter<___VARIABLE_moduleName___ViewEvent: ViewEvent, ___VARIABLE_moduleName___PresenterEvent: PresenterEvent, ___VARIABLE_moduleName___PresentableEvent: PresentableEvent>: EventPresenter<___VARIABLE_moduleName___ViewEvent, ___VARIABLE_moduleName___PresenterEvent, ___VARIABLE_moduleName___PresentableEvent>, ___VARIABLE_moduleName___ViewControllerEventListener {
    
    //MARK: Events Sending
    
    public var corePresentableEventListeners = MulticastDelegate<___VARIABLE_moduleName___CorePresentableEventListener>()
    
    open func send(event: ___VARIABLE_moduleName___CorePresentableEvent) {
        corePresentableEventListeners.invokeDelegates { (delegate) in
            delegate.presenter(didSend: event)
        }
    }
    
    //MARK: Events Catching
    
    override open func view(didSend event: ViewEvent) {
        if let viewEvent = event as? ___VARIABLE_moduleName___ViewEvent {
            self.view(didSend: viewEvent)
        }
    }

    // Generic Events Catching

    open override func view(didSend event: ___VARIABLE_moduleName___ViewEvent) { }
    
    open func viewController(didSend event: ___VARIABLE_moduleName___ViewControllerEvent) { }
}

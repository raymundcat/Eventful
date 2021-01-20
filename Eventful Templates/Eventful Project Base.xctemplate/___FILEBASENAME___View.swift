//___FILEHEADER___

import UIKit
import Eventful

open class ___VARIABLE_moduleName___RootView<___VARIABLE_moduleName___ViewEvent: ViewEvent, ___VARIABLE_moduleName___PresentableEvent: PresentableEvent>: EventRootView<___VARIABLE_moduleName___ViewEvent, ___VARIABLE_moduleName___PresentableEvent>, ___VARIABLE_moduleName___ViewControllerEventListener, ___VARIABLE_moduleName___CorePresentableEventListener {
    
    //MARK: Events Catching
    
    open override func presenter(didSend event: PresentableEvent) {
        if let presenterEvent = event as? ___VARIABLE_moduleName___PresentableEvent {
            self.presenter(didSend: presenterEvent)
        }
    }

    // MARK: Generic Event Catching

    open override func presenter(didSend event: ___VARIABLE_moduleName___PresentableEvent) { }
    
    open func viewController(didSend event: ___VARIABLE_moduleName___ViewControllerEvent) { }
    
    open func presenter(didSend event: ___VARIABLE_moduleName___CorePresentableEvent) { }
}

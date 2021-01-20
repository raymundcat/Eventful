//___FILEHEADER___

import Foundation
import Eventful

enum ___VARIABLE_moduleName___Event: Event { }

class ___VARIABLE_moduleName___ViewController: ___VARIABLE_baseClassName___ViewController<___VARIABLE_moduleName___Event, ___VARIABLE_moduleName___ViewEvent, ___VARIABLE_moduleName___PresenterEvent, ___VARIABLE_moduleName___PresentableEvent> {
    
    override func preparePresenter() -> ___VARIABLE_moduleName___Presenter {
        return ___VARIABLE_moduleName___Presenter()
    }
    
    override func prepareRootView() -> ___VARIABLE_moduleName___View {
        return ___VARIABLE_moduleName___View()
    }
}

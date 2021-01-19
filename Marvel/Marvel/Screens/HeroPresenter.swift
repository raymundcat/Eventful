//
//  HeroPresenter.swift
//  Marvel
//
//  Created by Raymund Catahay on 2021-01-19.
//

import Foundation
import Eventful

enum HeroPresenterEvent: PresenterEvent { }

enum HeroPresentableEvent: PresentableEvent { }

class HeroPresenter: MarvelPresenter<HeroViewEvent, HeroPresenterEvent, HeroPresentableEvent> {
    
    override func viewController(didSend event: MarvelViewControllerEvent) { }
    
    override func view(didSend event: HeroViewEvent) { }
}

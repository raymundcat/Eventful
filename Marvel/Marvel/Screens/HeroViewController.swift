//
//  HeroViewController.swift
//  Marvel
//
//  Created by Raymund Catahay on 2021-01-18.
//

import Foundation
import Eventful

enum HeroViewEvent: ViewEvent { }

enum HeroPresenterEvent: PresenterEvent { }

enum HeroPresentableEvent: PresentableEvent { }

class HeroViewController: MarvelViewController<HeroViewEvent, HeroPresenterEvent, HeroPresentableEvent> {
    
    override func preparePresenter() -> HeroPresenter {
        return HeroPresenter()
    }
    
    override func prepareRootView() -> HeroView {
        return HeroView()
    }
}

class HeroPresenter: MarvelPresenter<HeroViewEvent, HeroPresenterEvent, HeroPresentableEvent> {
    
    
}

class HeroView: MarvelRootView<HeroViewEvent, HeroPresentableEvent> {
    
    
}

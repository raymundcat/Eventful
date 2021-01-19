//
//  HeroViewController.swift
//  Marvel
//
//  Created by Raymund Catahay on 2021-01-18.
//

import Foundation
import Eventful

enum HeroEvent: Event { }

class HeroViewController: MarvelViewController<HeroEvent, HeroViewEvent, HeroPresenterEvent, HeroPresentableEvent> {
    
    override func preparePresenter() -> HeroPresenter {
        return HeroPresenter()
    }
    
    override func prepareRootView() -> HeroView {
        return HeroView()
    }
}

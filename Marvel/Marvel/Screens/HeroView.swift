//
//  HeroView.swift
//  Marvel
//
//  Created by Raymund Catahay on 2021-01-19.
//

import UIKit
import Eventful

enum HeroViewEvent: ViewEvent { }

class HeroView: MarvelRootView<HeroViewEvent, HeroPresentableEvent> {
    
    override func presenter(didSend event: HeroPresentableEvent) {
        
    }
}

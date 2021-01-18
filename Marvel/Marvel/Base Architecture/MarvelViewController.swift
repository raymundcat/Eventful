//
//  MarvelViewController.swift
//  Marvel
//
//  Created by Raymund Catahay on 2021-01-18.
//

import UIKit
import Eventful
import MulticastDelegate

public enum MarvelViewControllerEvent: Event {

    // Life Cycle Events
    case viewDidLoad
    case viewWillAppear(animate: Bool)
    case viewDidAppear(animated: Bool)
    case viewWillDisappear(animated: Bool)
    case viewDidDisappear(animated: Bool)

    // Keyboard Events
    case keyboardWillShow(frame: CGRect)
    case keyboardDidShow(frame: CGRect)
    case keyboardWillHide
    case keyboardDidHide
}

public protocol MarvelViewControllerEventListener: class {
    
    func viewController(didSend event: MarvelViewControllerEvent)
}

open class MarvelViewController<MarvelViewEvent: ViewEvent, MarvelPresenterEvent: PresenterEvent, MarvelPresentableEvent: PresentableEvent>: EventViewController<MarvelViewEvent, MarvelPresenterEvent, MarvelPresentableEvent> {
    
    //MARK: Life Cycle
    
    public override func setupBindings() {
        super.setupBindings()
        
        // ViewController Events
        if let rootView = rootView as? MarvelRootView,
           let rootPresenter = rootPresenter as? MarvelPresenter {
            
            // Attach View Controller Events
            viewControllerEventListeners.addDelegate(rootView)
            viewControllerEventListeners.addDelegate(rootPresenter)
            
            // Attach Core PResentable Events
            rootPresenter.corePresentableEventListeners.addDelegate(rootView)
        }
    }
    
    //MARK: Events Sending
    
    public var viewControllerEventListeners = MulticastDelegate<MarvelViewControllerEventListener>()
    
    open func send(event: MarvelViewControllerEvent) {
        viewControllerEventListeners.invokeDelegates { (delegate) in
            delegate.viewController(didSend: event)
        }
    }
    
    // MARK: Overriding functions

    public override func viewDidLoad() {
        super.viewDidLoad()
        send(event: .viewDidLoad)
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        send(event: .viewWillAppear(animate: animated))
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        send(event: .viewDidAppear(animated: animated))
    }

    public override func viewWillDisappear(_ animated: Bool) {
        send(event: .viewWillDisappear(animated: animated))
        super.viewWillDisappear(animated)
    }

    public override func viewDidDisappear(_ animated: Bool) {
        send(event: .viewDidDisappear(animated: animated))
        super.viewDidDisappear(animated)
    }

    @objc func keyboardWillShow(with frame: CGRect) {
        send(event: .keyboardWillShow(frame: frame))
    }

    @objc func keyboardDidShow(with frame: CGRect) {
        send(event: .keyboardDidShow(frame: frame))
    }

    @objc func keyboardWillHide() {
        send(event: .keyboardWillHide)
    }

    @objc func keyboardDidHide() {
        send(event: .keyboardDidHide)
    }
    
    //MARK: Keyboard Events

    func observeKeyboardEvents() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardNotificationWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardNotificationDidShow),
            name: UIResponder.keyboardDidShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardNotificationWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardNotificationWillHide),
            name: UIResponder.keyboardDidHideNotification,
            object: nil
        )
    }

    @objc func keyboardNotificationWillShow(_ notification: Notification) {
        guard let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        keyboardWillShow(with: keyboardFrame.cgRectValue)
    }

    @objc func keyboardNotificationDidShow(_ notification: Notification) {
        guard let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        keyboardDidShow(with: keyboardFrame.cgRectValue)
    }

    @objc func keyboardNotificationWillHide(_ notification: Notification) {
        keyboardWillHide()
    }

    @objc func keyboardNotificationDidHide(_ notification: Notification) {
        keyboardDidHide()
    }
}

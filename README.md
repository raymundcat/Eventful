# Eventful
Eventful is a Swift project plugin ready Coordinator pattern template designed to keep the flow of information across your Views and Business Layers unidirectional, concise and clean to scale.

This is made possible by binding the coordinator's three main components - ViewController *(Navigation)*, RootView *(View)* and Presenter *(Business Layer)* with Enum types of **Events** so each component know exactly the finite set of events they can receive from each other while keeping them completely abstracted

## Main Components

### ViewController
- The coordinator between the RootView and the Presenter which keeps their references alive, tying them to the lifecycle of the screen
- Holds all the navigation decisions as requested by the Presenter, initiating and ending  the lifecycle of other coordinators
- Handles any UI related declaration that the RootView could not reach such as Navigation and Status Bar theming

### Presenter
- The "business " layer of the screen where functions such as UI interaction interpretations and calls to the API layer of the application are made
- Sends events as commands to the RootView on **what to present to the users** or **influences how the view components may behave** themselves depending on the internal business decisions
- Sends events to the ViewController as **requests to initiate business flows**

### RootView
- Properly named as the view layer of the stack where all the design and layout declarations are placed
- Receives all events as commands from the Presenter layer while it catches all user interaction and reinterprets them as events to be reported back to the Presenter

## Integration

### Templating

### Preparing your Base Classes

### Subclassing

## Testing

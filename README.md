# RobuHub
RobuHub is an iOS Application to list all public repositories from Github and it's Robusta's task for iOS Software Engineer hiring process 🔥

## High level overview

#### Domain 

The `Domain` is basically what is RobuHub's App about and what it can do (Entities, UseCase etc.) **It does not depend on UIKit or any persistence framework**, and it doesn't have implementations apart from entities.

Entities are implemented as ObjectiveC types

```swift
@interface User: NSObject
@property(nonatomic, assign) double myID;
@end
```

UseCases are protocols which do one specific thing:

```swift
typedef void(^RepositoriesBlock)(NSArray *response);

@protocol RepositoriesUseCase

- (void) fetchRepositories:(NSString *)name page:(int)pageNumber countPerPage:(int)countPerPage completion:(RepositoriesBlock)completion;

@end
```

`UseCaseProvider` is a [service locator](https://en.wikipedia.org/wiki/Service_locator_pattern).  In the current app, it helps to hide the concrete implementation of use cases.


#### Platform

The `Platform` is a concrete implementation of the `Domain` in a specific platform like iOS. It does hide all implementation details. For example Database implementation whether it is CoreData, Realm, SQLite or Netowkring and Calling APIs using URLSession, Alamofire etc.

```swift
@implementation RepositoriesUseCase

- (id)init
{
    self.github = [NSURLSession sharedSession];
    return self;
}

- (void)fetchRepositories:(NSString *)name page:(int)pageNumber countPerPage:(int)countPerPage completion:(RepositoriesBlock)completion {
    [self.github fetchRepositories:name page:pageNumber countPerPage:countPerPage completion:^(RepositoriesResponse *response) {
    completion(response.repositories);
    }];
}

@end
```

As you can see, concrete implementations are internal, because we don't want to expose our dependecies. The only thing that is exposed in the current app from the `Platform` is a concrete implementation of the `UseCaseProvider`.

```swift
@implementation UseCaseProvider

- (id<RepositoriesUseCase>)makeRepositoriesUseCase {
    return [[RepositoriesUseCase alloc] init];
}

@end
```

#### Application
`Application` is responsible for delivering information to the user and handling user input. It can be implemented with any delivery pattern e.g (MVVM, MVC, MVP). This is the place for your `UIView`s and `UIViewController`s. As you will see from the app, `ViewControllers` are completely independent of the `Platform`.  The only responsibility of a view controller is to "bind" the UI to the Domain to make things happen.

## Low level Layers

### Run Requirements

* Xcode 12.0.1
* Swift 5.

#### MVP Concepts (Application Layer)
##### Presentation Logic
* `View` - delegates user interaction events to the `Presenter` and displays data passed by the `Presenter`
    * All `UIViewController`, `UIView`, `UITableViewCell` subclasses belong to the `View` layer
    * Usually the view is passive / dumb - it shouldn't contain any complex logic and that's why most of the times we don't need write Unit Tests for it
* `Presenter` - contains the presentation logic and tells the `View` what to present
    * Usually we have one `Presenter` per scene (view controller)
    * It doesn't reference the concrete type of the `View`, but rather it references the `View` protocol that is implemented usually by a `UIViewController` subclass
    * It should be a plain `Swift` class and not reference any `iOS` framework classes - this makes it easier to reuse it maybe in a `macOS` application
    * It should be covered by Unit Tests
* `Configurator` - injects the dependency object graph into the scene (view controller)
    * You could very easily use a DI (dependency injection) library. Unfortunately DI libraries are not quite mature yet on `iOS` / `Swift`
    * Usually it contains very simple logic and we don't need to write Unit Tests for it
* `Route` - mechanism which contains navigation logic and style from one view controller to another.

### Modularization

The corner stone of **Clean Architecture** is modularization, as you can hide implementation detail under `internal` access layer. Further read of this topic [here](https://tuist.io/docs/usage/microfeatures/)

### Links
* [MVP Clean Architecture](https://github.com/FortechRomania/ios-mvp-clean-architecture)
* [Robert C Martin - Clean Architecture and Design](https://www.youtube.com/watch?v=Nsjsiz2A9mg)
* [ViewModel](https://medium.com/@SergDort/viewmodel-in-rxswift-world-13d39faa2cf5#.qse37r6jw) in Rx world

### Any questions?

* Message me on [Facebook](https://www.facebook.com/KarimEbrahemAbdelaziz/)

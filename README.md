# Userwatch iOS Client Library

Userwatch is a service to help turn repeat signups and account sharers into
paying customers, while keeping bad actors out. Learn more about it at
[userwat.ch](https://userwat.ch). Userwatch is currently in beta release.

This library is for integrating Userwatch smarts into your iOS Application.
It is currently intended to be used with Swift code via Cocoapods, but you
may have luck with other setups.

## Getting started

### Get your API keys

Sign up for our beta at [userwat.ch/beta](https://www.userwat.ch/beta) to get
your Public API key.


### Add Userwatch to your project

Add a dependency on Userwatch to your `Podfile`:
```
  pod 'Userwatch', '~> 0.0.2'
```
Run `pod install` to download the dependency.

Next, import Userwatch into the Swift code where you wish to make use of it,
and also pull in your API key (replacing `ADD_API_KEY_HERE` with your key).
```
import Userwatch

let USERWATCH_PUBLIC_API_KEY = "ADD_API_KEY_HERE"
```

In an appropriate part of your code, create the UserwatchClient:
```
var userwatch: UserwatchClient?
do {
  userwatch = try UserwatchClient(publicApiKey: USERWATCH_PUBLIC_API_KEY)
} catch {
  print("UserwatchClient setup failed: \(error)")
}
```


### Identifying a User

The UserwatchClient can then be used to report user events, and in return get
flags and recommended actions. Provide details like their email or your own
internal user ID if available, or leave the nil otherwise.

In this example we report a LOGIN event by "your-user@example.com":
```
if let u = userwatch {
  u.identify(uid: nil,
           email: "your-user@example.com",
           phone: nil,
        username: nil,
             did: Uwproto_EventType.login) { analysis in
    // Do something with the AnalysisResponse
  } failure: {
    print("Userwatch identify failed: \(error)")
  }
}
```

You can dig into all the information included in the `AnalysisResponse` by
having a look at the
[protocol buffer](https://github.com/Userwatch/userwatch-ios/blob/main/Userwatch/protos/userwatch_public.proto).


### Get a Validation Token to use with a Server API client

To get a Validation Token, call `validate` instead of `identify`. You will get
back a token in a `ValidateResponse`, rather than the full `AnalysisResponse`.
The token can then be used with a server API such as userwatch-go.
```
var userwatchToken: String?
var userwatchSignature: String?
u.validate(uid: nil,
         email: "your-user@example.com",
         phone: nil,
      username: nil,
           did: Uwproto_EventType.login) { resp in
  userwatchToken = resp.validationToken
  userwatchSignature = resp.validationSignature
} failure: {
  print("Userwatch identify failed: \(error)")
}
```


## Userwatch vs UserwatchCore

You may notice there is also a UserwatchCore cocoapod. We recommend you depend
on Userwatch, which internally depends on UserwatchCore, rather than using
UserwatchCore directly.

Unlike Userwatch, UserwatchCore has no guarantees of API compatibility even
on minor version updates.

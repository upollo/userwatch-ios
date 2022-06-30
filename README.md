# Userwatch iOS Client Library

Userwatch is a service to help turn repeat signups and account sharers into
paying customers, while keeping bad actors out. Learn more about it at
[userwat.ch](https://userwat.ch). Userwatch is currently in beta release.

This library is for integrating Userwatch smarts into your iOS Application.
It is currently intended to be used with Swift code via Cocoapods, but you
may have luck with other setups.

Get growing in a few short steps by following the instructions in the
Userwatch [Quick Start](https://userwat.ch/docs/quick-start). For more
details, see the
[Client Libraries](https://userwat.ch/docs/reference/client-libraries)
documentation.

## Userwatch vs UserwatchCore

You may notice there is also a UserwatchCore cocoapod. We recommend you depend
on Userwatch, which internally depends on UserwatchCore, rather than using
UserwatchCore directly.

Unlike Userwatch, UserwatchCore has no guarantees of API compatibility even
on minor version updates.

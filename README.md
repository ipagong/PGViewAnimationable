# PGViewAnimationable

[![CI Status](http://img.shields.io/travis/ipagong/PGViewAnimationable.svg?style=flat)](https://travis-ci.org/ipagong/PGViewAnimationable)
[![Version](https://img.shields.io/cocoapods/v/PGViewAnimationable.svg?style=flat)](http://cocoapods.org/pods/PGViewAnimationable)
[![License](https://img.shields.io/cocoapods/l/PGViewAnimationable.svg?style=flat)](http://cocoapods.org/pods/PGViewAnimationable)
[![Platform](https://img.shields.io/cocoapods/p/PGViewAnimationable.svg?style=flat)](http://cocoapods.org/pods/PGViewAnimationable)

It simply provide view animations with enum type (left/right/up/down/fade)

You can simple use it through protocol with your custom views.
(but, recommend it with clear backgroundcolor.)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

appetize.io demo : [\[ here \]](https://appetize.io/embed/ffwrpj5nttjrfcna4f1606w02m?device=iphone5s&scale=75&orientation=portrait&osVersion=9.3)


Make custom view with ViewAnimationable protocol.  

```swift
class XxxxImageView: UIImageView, ViewAnimationable {

    /* required protocl variable. */
    public var type:ViewAnimationType = .up

    /* use executeAnimation methods when you need. */
    public func startXxxxAnimation() {
        executeAnimation {
            /* do something. between animation. */
            // in this sample, need to change image.
        }
    }
}
```

## Requirements

- above ios 8.0
- swift 3.0
- with cocoapods

## Installation

PGViewAnimationable is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "PGViewAnimationable"
```

## Author

ipagong, ipagong.dev@gmail.com

## License

PGViewAnimationable is available under the MIT license. See the LICENSE file for more info.

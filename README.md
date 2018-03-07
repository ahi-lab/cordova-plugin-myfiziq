![MyFiziq Logo](https://www.myfiziq.com/assets/images/logo.svg)

# Installation

1. Add the MyFiziqSDK Cordova Plugin to the Cordova Project:
```sh
cordova plugin add https://github.com/MyFiziqApp/cordova-plugin-myfiziq.git
```
1. Add the iOS platform to the Cordova Project:
```sh
cordova platform add ios
```

When the ios platform add command is run, the MyFiziqSDK Cocoapod and dependencies will be downloaded and integrated into the Cordova Project.

## Use example

In the Cordova App projct, ddit `www/js/index.js` and add the following code inside `onDeviceReady`

```js
    var success = function(message) {
        alert(message);
    }

    var failure = function() {
        alert("Error calling MyFiziq Plugin setup");
    }

    myfiziq.mfzSdkSetup("MYFIZIQ KEY", "MYFIZIQ SECRET", "MYFIZIQ ENV", success, failure);
```

## Author

MyFiziq iOS Dev, dev@myfiziq.com

## License

MyFiziqSDK is Copyright 2017, 2018. Refer to LICENSE.md for details.

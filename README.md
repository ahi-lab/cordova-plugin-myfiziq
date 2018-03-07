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

In the Cordova App projct, edit `www/js/index.js` and implement the following:

```js
onDeviceReady: function() {
    var success = function() {
        alert("MyFiziqSDK setup success");
    }
    var failure = function(msg) {
        alert("MyFiziqSDK setup failed");
    }
    myfiziq.mfzSdkSetup("MYFIZIQ KEY", "MYFIZIQ SECRET", "MYFIZIQ ENV", success, failure);

    app.receivedEvent('deviceready');
},
myfiziqGetAuthToken: function() {
    var success = function() {
        alert("MyFiziqSDK auth success");
    }
    var failure = function(msg) {
        alert("MyFiziqSDK auth failed");
    }
    myfiziq.mfzSdkAnswerLogins("IDP KEY", "IDP TOKEN", success, failure);
}
```

**NOTE:** Be sure to answer the auth token request by facilitating the AWS Cognito Federated Identity service requirement by passing the idP key and token to the mfzSdkAnswerLogins function call. See: https://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/CognitoIdentity.html#getId-property for more information.

If user not logged in, just pass empty strings to the answer function: `myfiziq.mfzSdkAnswerLogins("", "", success, failure);`.

## Author

MyFiziq iOS Dev, dev@myfiziq.com

## License

MyFiziqSDK is Copyright 2017, 2018. Refer to LICENSE.md for details.

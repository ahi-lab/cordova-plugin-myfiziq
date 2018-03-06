/********* cordova-plugin-myfiziq.m Cordova Plugin Implementation *******/

#import "cordova-plugin-myfiziq.h"

@interface CordovaPluginMyfiziq()
@property (nonatomic, strong) NSDictionary *m_config;
@property (nonatomic, strong) AWSTaskCompletionSource<NSDictionary *> *m_authTokens;
@end


@implementation CordovaPluginMyfiziq

#pragma mark Delegates

/*
App reload (lifecycle for camera permissions form example), will cause reload to execute.
 */
- (void)reloadMyFiziqSDK {
    @try {
        // NOTE: Update to retrieve from KeyChain, as variables likely NULL when reload is ever called.
        if (self.m_config) {
            MyFiziqSDK *mfz = [MyFiziqSDK shared];
            [mfz setupWithConfig:self.m_config
                    authDelegate:self
                        success:^(NSDictionary * _Nonnull status) {
                            NSLog(@"MyFiziqSDK reload success");
                        } failure:^(NSError * _Nonnull error) {
                            NSLog(@"%@",error.localizedDescription);
                        }];
        }
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
    }
}

/*
AWS service calls this when authentication token is required. This invokes Cordova CB 'myfiziqGetAuthToken', which
indirectly invokes plugin 'logins' with the auth token set.
*/
- (AWSTask<NSDictionary<NSString *, NSString *> *> *)logins {
    self.m_authTokens = [[AWSTaskCompletionSource<NSDictionary *> alloc] init];
    if (self.commandDelegate) {
        // Call the Cordova responder.
        [self.commandDelegate evalJs:@"myfiziqGetAuthToken()"];
    } else {
        [self.m_authTokens trySetResult:nil];
    }
    return [AWSTask taskForCompletionOfAnyTask:@[self.m_authTokens.task]];
}

#pragma mark Cordova bindings

#pragma mark - MyFiziqSDK Methods

/*
- key
- secret
- environment
- success_cb
- error_cb
 */
- (void)mfzSdkSetup:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        NSString *key = [command.arguments objectAtIndex:0];
        NSString *secret = [command.arguments objectAtIndex:1];
        NSString *env = [command.arguments objectAtIndex:2];
        // REQUIRED: Initiate the MyFiziq service with the App configuration.
        self.m_config = @{ kMFZSetupKey:key,kMFZSetupSecret:secret, kMFZSetupEnvironment:env };
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        [mfz setupWithConfig:self.m_config
                authDelegate:self
                     success:^(NSDictionary * _Nonnull status) {
                         pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
                         [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                    } failure:^(NSError * _Nonnull error) {
                         pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:error.localizedDescription];
                         [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
                    }];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

/*
- idp_key
- idp_token
 */
- (void)mfzSdkAnswerLogins:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        NSString *idp_key = [command.arguments objectAtIndex:0];
        NSString *idp_token = [command.arguments objectAtIndex:1];
        // Try set response
        NSDictionary *tokenResult = @{idp_key:idp_token};
        if (self.m_authTokens) {
            [self.m_authTokens trySetResult:tokenResult];
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

/*
-
 */
- (void)mfzSdkInitiateAvatarCreation:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        [mfz initiateAvatarCreationWithOptions:nil fromViewController:self.viewController completion:^(NSError * _Nullable errCapture) {
            if (!errCapture) {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            } else {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errCapture.localizedDescription];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

#pragma mark - MyFiziqSDK Properties

- (void)mfzSdkStatusConnection:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsNSUInteger:mfz.statusConnection];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzSdkStatusVersion:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsNSUInteger:mfz.statusVersion];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzSdkAppId:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:mfz.appId];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzSdkVendorId:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:mfz.vendorId];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzSdkClientId:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:mfz.clientId];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzSdkEnv:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:mfz.env];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzSdkCognitoUserPoolId:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:mfz.cognitoUserPoolId];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzSdkCognitoUserPoolRegion:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:mfz.cognitoUserPoolRegion];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzSdkCognitoUserPoolLoginsKey:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:mfz.cognitoUserPoolLoginsKey];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

#pragma mark - MyFiziqUser Methods

/*
- optional_email
 */
- (void)mfzUserRegister:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        NSString *email = [command.arguments objectAtIndex:0];
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        [mfz.user registerWithEmail:email completion:^(NSError *regErr, NSString *userid, NSString *clashid) {
            if (!regErr) {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            } else {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:regErr.localizedDescription];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

/*
- optional_email
 */
- (void)mfzUserLogin:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        NSString *email = [command.arguments objectAtIndex:0];
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        [mfz.user logInWithEmail:email completion:^(NSError *error) {
            if (!error) {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            } else {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:error.localizedDescription];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

/*
- 
 */
- (void)mfzUserLogout:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        [mfz.user logOutWithCompletion:^(NSError *err) {
            if (!err) {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            } else {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:err.localizedDescription];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

/*
- 
 */
- (void)mfzUserUpdateDetails:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        [mfz.user updateDetailsWithCompletion:^(NSError *errUpdate) {
            if (!errUpdate) {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            } else {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:errUpdate.localizedDescription];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

#pragma mark - MyFiziqUser Properties

- (void)mfzUserIsLoggedIn:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:mfz.user.isLoggedIn];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzUserId:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsNSUInteger:mfz.user.uid];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzUserGender:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsNSUInteger:mfz.user.gender];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzUserSetGender:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        NSNumber *newGender = [command.arguments objectAtIndex:0];
        if ([newGender unsignedIntegerValue] == kMFZGenderMale) {
            mfz.user.gender = kMFZGenderMale;
        } else {
            mfz.user.gender = kMFZGenderFemale;
        }
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsNSUInteger:mfz.user.gender];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzUserEmail:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:mfz.user.email];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzUserSetEmail:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        NSString *newEmail = [command.arguments objectAtIndex:0];
        mfz.user.email = newEmail;
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:mfz.user.email];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzUserMeasurementPreference:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsNSUInteger:mfz.user.measurementPreference];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzUserSetMeasurementPreference:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        NSNumber *newMeasurePref = [command.arguments objectAtIndex:0];
        if ([newMeasurePref unsignedIntegerValue] == kMFZMeasurementImperial) {
            mfz.user.measurementPreference = kMFZMeasurementImperial;
        } else {
            mfz.user.measurementPreference = kMFZMeasurementMetric;
        }
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsNSUInteger:mfz.user.measurementPreference];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzUserWeightInKg:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:(double)mfz.user.weightInKg];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzUserSetWeightInKg:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        NSNumber *newWeight = [command.arguments objectAtIndex:0];
        float fltWeight = [newWeight floatValue];
        mfz.user.weightInKg = fltWeight;
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:(double)mfz.user.weightInKg];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzUserHeightInCm:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:(double)mfz.user.heightInCm];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzUserSetHeightInCm:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        NSNumber *newHeight = [command.arguments objectAtIndex:0];
        float fltHeight = [newHeight floatValue];
        mfz.user.heightInCm = fltHeight;
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:(double)mfz.user.heightInCm];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

#pragma mark - MyFiziqAvatar Methods

// Private Helper to get avatar corresponding to attempt id
- (MyFiziqAvatar *)getAvatarForAttemptId:(NSString *)attemptId {
    MyFiziqSDK *mfz = [MyFiziqSDK shared];
    // Find corresponding avatar reference.
    for (MyFiziqAvatar *a in mfz.avatars.all) {
        if ([a.attemptId isEqualToString:attemptId]) {
            return a;
        }
    }
    return nil;
}

/*
- attempt_id
 */
- (void)mfzAvatarDownloadMesh:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqAvatar *avatar = [self getAvatarForAttemptId:[command.arguments objectAtIndex:0]];
        if (!avatar) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"No corresponding avatar with attempt id found"];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        } else {
            [avatar downloadMeshWithSuccess:^{
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            } failure:^(NSError *err) {
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:err.localizedDescription];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            } progress:nil];
        }
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

#pragma mark - MyFiziqAvatar Properties

- (void)mfzAvatarHasDownloadedMesh:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqAvatar *avatar = [self getAvatarForAttemptId:[command.arguments objectAtIndex:0]];
        if (!avatar) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"No corresponding avatar with attempt id found"];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:avatar.hasDownloadedMesh];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzAvatarDate:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqAvatar *avatar = [self getAvatarForAttemptId:[command.arguments objectAtIndex:0]];
        if (!avatar) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"No corresponding avatar with attempt id found"];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[avatar.date aws_stringValue:AWSDateISO8601DateFormat3]];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzAvatarGender:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqAvatar *avatar = [self getAvatarForAttemptId:[command.arguments objectAtIndex:0]];
        if (!avatar) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"No corresponding avatar with attempt id found"];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsNSUInteger:avatar.gender];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzAvatarMeshCachedFile:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqAvatar *avatar = [self getAvatarForAttemptId:[command.arguments objectAtIndex:0]];
        if (!avatar) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"No corresponding avatar with attempt id found"];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:avatar.meshCachedFile.path];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzAvatarState:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqAvatar *avatar = [self getAvatarForAttemptId:[command.arguments objectAtIndex:0]];
        if (!avatar) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"No corresponding avatar with attempt id found"];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsNSUInteger:avatar.state];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzAvatarHeightInCm:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqAvatar *avatar = [self getAvatarForAttemptId:[command.arguments objectAtIndex:0]];
        if (!avatar) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"No corresponding avatar with attempt id found"];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:avatar.heightInCm];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzAvatarWeightInKg:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqAvatar *avatar = [self getAvatarForAttemptId:[command.arguments objectAtIndex:0]];
        if (!avatar) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"No corresponding avatar with attempt id found"];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:avatar.weightInKg];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzAvatarChestInCm:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqAvatar *avatar = [self getAvatarForAttemptId:[command.arguments objectAtIndex:0]];
        if (!avatar) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"No corresponding avatar with attempt id found"];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:avatar.chestInCm];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzAvatarWaistInCm:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqAvatar *avatar = [self getAvatarForAttemptId:[command.arguments objectAtIndex:0]];
        if (!avatar) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"No corresponding avatar with attempt id found"];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:avatar.waistInCm];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzAvatarHipInCm:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqAvatar *avatar = [self getAvatarForAttemptId:[command.arguments objectAtIndex:0]];
        if (!avatar) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"No corresponding avatar with attempt id found"];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:avatar.hipInCm];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzAvatarInseamInCm:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqAvatar *avatar = [self getAvatarForAttemptId:[command.arguments objectAtIndex:0]];
        if (!avatar) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"No corresponding avatar with attempt id found"];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:avatar.inseamInCm];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void)mfzAvatarThighInCm:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqAvatar *avatar = [self getAvatarForAttemptId:[command.arguments objectAtIndex:0]];
        if (!avatar) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"No corresponding avatar with attempt id found"];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDouble:avatar.thighInCm];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

#pragma mark - MyFiziqAvatarManager Methods

/*
- 
 */
- (void)mfzAvatarMgrRequestAvatars:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        [mfz.avatars requestAvatarsWithSuccess:^{
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        } failure:^(NSError *error) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:error.localizedDescription];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

/*
- attempt_ids[]
 */
- (void)mfzAvatarMgrDeleteAvatars:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        // Construct the array with strict types
        NSMutableArray<NSString *> *arr = [[NSMutableArray<NSString *> alloc] initWithCapacity:command.arguments.count];
        for (id a in command.arguments) {
            [arr addObject:(NSString *)a];
        }
        // Delete all avatars in the list.
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        [mfz.avatars deleteAvatars:(NSArray *)arr success:^{
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        } failure:^(NSError *error) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:error.localizedDescription];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

#pragma mark - MyFiziqAvatarManager Properties

- (void)mfzAvatarMgrAllAvatars:(CDVInvokedUrlCommand *)command {
    __block CDVPluginResult *pluginResult = nil;
    @try {
        MyFiziqSDK *mfz = [MyFiziqSDK shared];
        // Construct the return array
        NSMutableArray<NSString *> *arr = [[NSMutableArray<NSString *> alloc] initWithCapacity:mfz.avatars.all.count];
        for (MyFiziqAvatar *a in mfz.avatars.all) {
            [arr addObject:(NSString *)a.attemptId];
        }
        // Return as multipart of all the attempt ids
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsMultipart:arr];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    } @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

@end

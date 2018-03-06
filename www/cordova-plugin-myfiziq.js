cordova.define("com.myfiziq.sdk.cordova-plugin-myfiziq", function(require, exports, module) {
    var exec = require('cordova/exec');
    
    /* MyFiziqSDK */
    exports.mfzSdkSetup = function (key, secret, environment, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzSdkSetup', [key, secret, environment]);
    };
    exports.mfzSdkAnswerLogins = function (idp_key, idp_token, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzSdkAnswerLogins', [idp_key, idp_token]);
    };
    exports.mfzSdkInitiateAvatarCreation = function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzSdkInitiateAvatarCreation', [idp_key, idp_token]);
    };
    // Properties
    exports.mfzSdkStatusConnection = function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzSdkStatusConnection', []);
    };
    exports.mfzSdkStatusVersion = function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzSdkStatusVersion', []);
    };
    exports.mfzSdkAppId = function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzSdkAppId', []);
    };
    exports.mfzSdkVendorId = function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzSdkVendorId', []);
    };
    exports.mfzSdkClientId = function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzSdkClientId', []);
    };
    exports.mfzSdkEnv = function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzSdkEnv', []);
    };
    exports.mfzSdkCognitoUserPoolId = function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzSdkCognitoUserPoolId', []);
    };
    exports.mfzSdkCognitoUserPoolRegion = function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzSdkCognitoUserPoolRegion', []);
    };
    exports.mfzSdkCognitoUserPoolLoginsKey = function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzSdkCognitoUserPoolLoginsKey', []);
    };
    
    /* MyFiziqUser */
    exports.mfzUserRegister = function (optional_email, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserRegister', [optional_email]);
    };
    exports.mfzUserLogin = function (optional_email, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserLogin', [optional_email]);
    };
    exports.mfzUserLogout = function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserLogout', []);
    };
    exports.mfzUserUpdateDetails = function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserUpdateDetails', []);
    };
    // Properties
    exports.mfzUserIsLoggedIn = function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserIsLoggedIn', []);
    };
    exports.mfzUserId = function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserId', []);
    };
    exports.mfzUserGender = function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserGender', []);
    };
    exports.mfzUserSetGender = function (new_gender, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserSetGender', [new_gender]);
    };
    exports.mfzUserEmail = function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserEmail', []);
    };
    exports.mfzUserSetEmail = function (new_email, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserSetEmail', [new_email]);
    };
    exports.mfzUserMeasurementPreference = function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserMeasurementPreference', []);
    };
    exports.mfzUserSetMeasurementPreference = function (new_measure_pref, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserSetMeasurementPreference', [new_measure_pref]);
    };
    exports.mfzUserWeightInKg = function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserWeightInKg', []);
    };
    exports.mfzUserSetWeightInKg = function (new_weight, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserSetWeightInKg', [new_weight]);
    };
    exports.mfzUserHeightInCm = function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserHeightInCm', []);
    };
    exports.mfzUserSetHeightInCm = function (new_height, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserSetHeightInCm', [new_height]);
    };
    
    /* MyFiziqAvatar */
    exports.mfzAvatarDownloadMesh = function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarDownloadMesh', [attempt_id]);
    };
    // Properties
    exports.mfzAvatarHasDownloadedMesh = function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarHasDownloadedMesh', [attempt_id]);
    };
    exports.mfzAvatarDate = function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarDate', [attempt_id]);
    };
    exports.mfzAvatarGender = function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarGender', [attempt_id]);
    };
    exports.mfzAvatarMeshCachedFile = function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarMeshCachedFile', [attempt_id]);
    };
    exports.mfzAvatarState = function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarState', [attempt_id]);
    };
    exports.mfzAvatarHeightInCm = function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarHeightInCm', [attempt_id]);
    };
    exports.mfzAvatarWeightInKg = function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarWeightInKg', [attempt_id]);
    };
    exports.mfzAvatarChestInCm = function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarChestInCm', [attempt_id]);
    };
    exports.mfzAvatarWaistInCm = function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarWaistInCm', [attempt_id]);
    };
    exports.mfzAvatarHipInCm = function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarHipInCm', [attempt_id]);
    };
    exports.mfzAvatarInseamInCm = function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarInseamInCm', [attempt_id]);
    };
    exports.mfzAvatarThighInCm = function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarThighInCm', [attempt_id]);
    };
    
    /* MyFiziqAvatarManager */
    exports.mfzAvatarMgrRequestAvatars = function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarMgrRequestAvatars', []);
    };
    exports.mfzAvatarMgrDeleteAvatars = function (attempt_ids, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarMgrDeleteAvatars', attempt_ids);
    };
    // Properties
    exports.mfzAvatarMgrAllAvatars = function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarMgrAllAvatars', [new_height]);
    };
    
});
    
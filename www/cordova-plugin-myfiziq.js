
var exec = require('cordova/exec');

var PLUGIN_NAME = 'CordovaPluginMyFiziq';

var CordovaPluginMyFiziq = {
    /* MyFiziqSDK */
    mfzSdkSetup: function (key, secret, environment, success_cb, error_cb) {
        exec(success_cb, error_cb, PLUGIN_NAME, 'mfzSdkSetup', [key, secret, environment]);
    },
    mfzSdkAnswerLogins: function (idp_key, idp_token, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzSdkAnswerLogins', [idp_key, idp_token]);
    },
    mfzSdkInitiateAvatarCreation: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzSdkInitiateAvatarCreation', [idp_key, idp_token]);
    },
    // Properties
    mfzSdkStatusConnection: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzSdkStatusConnection', []);
    },
    mfzSdkStatusVersion: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzSdkStatusVersion', []);
    },
    mfzSdkAppId: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzSdkAppId', []);
    },
    mfzSdkVendorId: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzSdkVendorId', []);
    },
    mfzSdkClientId: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzSdkClientId', []);
    },
    mfzSdkEnv: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzSdkEnv', []);
    },
    mfzSdkCognitoUserPoolId: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzSdkCognitoUserPoolId', []);
    },
    mfzSdkCognitoUserPoolRegion: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzSdkCognitoUserPoolRegion', []);
    },
    mfzSdkCognitoUserPoolLoginsKey: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzSdkCognitoUserPoolLoginsKey', []);
    },
    
    /* MyFiziqUser */
    mfzUserRegister: function (optional_email, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserRegister', [optional_email]);
    },
    mfzUserLogin: function (optional_email, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserLogin', [optional_email]);
    },
    mfzUserLogout: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserLogout', []);
    },
    mfzUserUpdateDetails: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserUpdateDetails', []);
    },
    // Properties
    mfzUserIsLoggedIn: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserIsLoggedIn', []);
    },
    mfzUserId: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserId', []);
    },
    mfzUserGender: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserGender', []);
    },
    mfzUserSetGender: function (new_gender, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserSetGender', [new_gender]);
    },
    mfzUserEmail: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserEmail', []);
    },
    mfzUserSetEmail: function (new_email, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserSetEmail', [new_email]);
    },
    mfzUserMeasurementPreference: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserMeasurementPreference', []);
    },
    mfzUserSetMeasurementPreference: function (new_measure_pref, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserSetMeasurementPreference', [new_measure_pref]);
    },
    mfzUserWeightInKg: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserWeightInKg', []);
    },
    mfzUserSetWeightInKg: function (new_weight, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserSetWeightInKg', [new_weight]);
    },
    mfzUserHeightInCm: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserHeightInCm', []);
    },
    mfzUserSetHeightInCm: function (new_height, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzUserSetHeightInCm', [new_height]);
    },
    
    /* MyFiziqAvatar */
    mfzAvatarDownloadMesh: function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarDownloadMesh', [attempt_id]);
    },
    // Properties
    mfzAvatarHasDownloadedMesh: function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarHasDownloadedMesh', [attempt_id]);
    },
    mfzAvatarDate: function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarDate', [attempt_id]);
    },
    mfzAvatarGender: function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarGender', [attempt_id]);
    },
    mfzAvatarMeshCachedFile: function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarMeshCachedFile', [attempt_id]);
    },
    mfzAvatarState: function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarState', [attempt_id]);
    },
    mfzAvatarHeightInCm: function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarHeightInCm', [attempt_id]);
    },
    mfzAvatarWeightInKg: function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarWeightInKg', [attempt_id]);
    },
    mfzAvatarChestInCm: function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarChestInCm', [attempt_id]);
    },
    mfzAvatarWaistInCm: function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarWaistInCm', [attempt_id]);
    },
    mfzAvatarHipInCm: function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarHipInCm', [attempt_id]);
    },
    mfzAvatarInseamInCm: function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarInseamInCm', [attempt_id]);
    },
    mfzAvatarThighInCm: function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarThighInCm', [attempt_id]);
    },
    
    /* MyFiziqAvatarManager */
    mfzAvatarMgrRequestAvatars: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarMgrRequestAvatars', []);
    },
    mfzAvatarMgrDeleteAvatars: function (attempt_ids, success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarMgrDeleteAvatars', attempt_ids);
    },
    // Properties
    mfzAvatarMgrAllAvatars: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'CordovaPluginMyfiziq', 'mfzAvatarMgrAllAvatars', [new_height]);
    }
};

module.exports = CordovaPluginMyFiziq;

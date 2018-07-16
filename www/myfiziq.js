/*global cordova, module*/
var exec = require('cordova/exec');

module.exports = {
    /* MyFiziqSDK */
    mfzSdkSetup: function (key, secret, environment, success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzSdkSetup', [key, secret, environment]);
    },
    mfzSdkAnswerLogins: function (idp_key, idp_token, success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzSdkAnswerLogins', [idp_key, idp_token]);
    },
    mfzSdkInitiateAvatarCreation: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzSdkInitiateAvatarCreation', []);
    },
    // Properties
    mfzSdkStatusConnection: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzSdkStatusConnection', []);
    },
    mfzSdkStatusVersion: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzSdkStatusVersion', []);
    },
    mfzSdkAppId: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzSdkAppId', []);
    },
    mfzSdkVendorId: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzSdkVendorId', []);
    },
    mfzSdkClientId: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzSdkClientId', []);
    },
    mfzSdkEnv: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzSdkEnv', []);
    },
    mfzSdkCognitoUserPoolId: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzSdkCognitoUserPoolId', []);
    },
    mfzSdkCognitoUserPoolRegion: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzSdkCognitoUserPoolRegion', []);
    },
    mfzSdkCognitoUserPoolLoginsKey: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzSdkCognitoUserPoolLoginsKey', []);
    },

    /* MyFiziqBundle */
    mfzSdkLoadCSS: function (css_file_path, success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzSdkLoadCSS', [css_file_path]);
    },
    
    /* MyFiziqUser */
    mfzUserRegister: function (optional_email, success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzUserRegister', [optional_email]);
    },
    mfzUserLogin: function (optional_email, success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzUserLogin', [optional_email]);
    },
    mfzUserLogout: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzUserLogout', []);
    },
    mfzUserUpdateDetails: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzUserUpdateDetails', []);
    },
    // Properties
    mfzUserIsLoggedIn: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzUserIsLoggedIn', []);
    },
    mfzUserId: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzUserId', []);
    },
    mfzUserGender: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzUserGender', []);
    },
    mfzUserSetGender: function (new_gender, success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzUserSetGender', [new_gender]);
    },
    mfzUserEmail: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzUserEmail', []);
    },
    mfzUserSetEmail: function (new_email, success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzUserSetEmail', [new_email]);
    },
    mfzUserMeasurementPreference: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzUserMeasurementPreference', []);
    },
    mfzUserSetMeasurementPreference: function (new_measure_pref, success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzUserSetMeasurementPreference', [new_measure_pref]);
    },
    mfzUserWeightInKg: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzUserWeightInKg', []);
    },
    mfzUserSetWeightInKg: function (new_weight, success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzUserSetWeightInKg', [new_weight]);
    },
    mfzUserHeightInCm: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzUserHeightInCm', []);
    },
    mfzUserSetHeightInCm: function (new_height, success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzUserSetHeightInCm', [new_height]);
    },
    
    /* MyFiziqAvatar */
    mfzAvatarDownloadMesh: function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzAvatarDownloadMesh', [attempt_id]);
    },
    // Properties
    mfzAvatarHasDownloadedMesh: function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzAvatarHasDownloadedMesh', [attempt_id]);
    },
    mfzAvatarDate: function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzAvatarDate', [attempt_id]);
    },
    mfzAvatarGender: function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzAvatarGender', [attempt_id]);
    },
    mfzAvatarMeshCachedFile: function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzAvatarMeshCachedFile', [attempt_id]);
    },
    mfzAvatarState: function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzAvatarState', [attempt_id]);
    },
    mfzAvatarHeightInCm: function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzAvatarHeightInCm', [attempt_id]);
    },
    mfzAvatarWeightInKg: function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzAvatarWeightInKg', [attempt_id]);
    },
    mfzAvatarChestInCm: function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzAvatarChestInCm', [attempt_id]);
    },
    mfzAvatarWaistInCm: function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzAvatarWaistInCm', [attempt_id]);
    },
    mfzAvatarHipInCm: function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzAvatarHipInCm', [attempt_id]);
    },
    mfzAvatarInseamInCm: function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzAvatarInseamInCm', [attempt_id]);
    },
    mfzAvatarThighInCm: function (attempt_id, success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzAvatarThighInCm', [attempt_id]);
    },
    
    /* MyFiziqAvatarManager */
    mfzAvatarMgrRequestAvatars: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzAvatarMgrRequestAvatars', []);
    },
    mfzAvatarMgrDeleteAvatars: function (attempt_ids, success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzAvatarMgrDeleteAvatars', attempt_ids);
    },
    // Properties
    mfzAvatarMgrAllAvatars: function (success_cb, error_cb) {
        exec(success_cb, error_cb, 'MyFiziq', 'mfzAvatarMgrAllAvatars', []);
    }
};

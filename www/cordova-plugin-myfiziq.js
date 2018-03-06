var exec = require('cordova/exec');

/* MyFiziqSDK */
exports.mfzSdkSetup = function (key, secret, environment, success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzSdkSetup', [key, secret, environment]);
};
exports.mfzSdkAnswerLogins = function (idp_key, idp_token, success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzSdkAnswerLogins', [idp_key, idp_token]);
};
exports.mfzSdkInitiateAvatarCreation = function (success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzSdkInitiateAvatarCreation', [idp_key, idp_token]);
};
// Properties
exports.mfzSdkStatusConnection = function (success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzSdkStatusConnection', []);
};
exports.mfzSdkStatusVersion = function (success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzSdkStatusVersion', []);
};
exports.mfzSdkAppId = function (success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzSdkAppId', []);
};
exports.mfzSdkVendorId = function (success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzSdkVendorId', []);
};
exports.mfzSdkClientId = function (success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzSdkClientId', []);
};
exports.mfzSdkEnv = function (success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzSdkEnv', []);
};
exports.mfzSdkCognitoUserPoolId = function (success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzSdkCognitoUserPoolId', []);
};
exports.mfzSdkCognitoUserPoolRegion = function (success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzSdkCognitoUserPoolRegion', []);
};
exports.mfzSdkCognitoUserPoolLoginsKey = function (success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzSdkCognitoUserPoolLoginsKey', []);
};

/* MyFiziqUser */
exports.mfzUserRegister = function (optional_email, success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzUserRegister', [optional_email]);
};
exports.mfzUserLogin = function (optional_email, success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzUserLogin', [optional_email]);
};
exports.mfzUserLogout = function (success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzUserLogout', []);
};
exports.mfzUserUpdateDetails = function (success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzUserUpdateDetails', []);
};
// Properties
exports.mfzUserIsLoggedIn = function (success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzUserIsLoggedIn', []);
};
exports.mfzUserId = function (success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzUserId', []);
};
exports.mfzUserGender = function (success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzUserGender', []);
};
exports.mfzUserSetGender = function (new_gender, success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzUserSetGender', [new_gender]);
};
exports.mfzUserEmail = function (success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzUserEmail', []);
};
exports.mfzUserSetEmail = function (new_email, success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzUserSetEmail', [new_email]);
};
exports.mfzUserMeasurementPreference = function (success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzUserMeasurementPreference', []);
};
exports.mfzUserSetMeasurementPreference = function (new_measure_pref, success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzUserSetMeasurementPreference', [new_measure_pref]);
};
exports.mfzUserWeightInKg = function (success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzUserWeightInKg', []);
};
exports.mfzUserSetWeightInKg = function (new_weight, success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzUserSetWeightInKg', [new_weight]);
};
exports.mfzUserHeightInCm = function (success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzUserHeightInCm', []);
};
exports.mfzUserSetHeightInCm = function (new_height, success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzUserSetHeightInCm', [new_height]);
};

/* MyFiziqAvatar */
exports.mfzAvatarDownloadMesh = function (attempt_id, success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzAvatarDownloadMesh', [attempt_id]);
};
// Properties
exports.mfzAvatarHasDownloadedMesh = function (attempt_id, success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzAvatarHasDownloadedMesh', [attempt_id]);
};
exports.mfzAvatarDate = function (attempt_id, success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzAvatarDate', [attempt_id]);
};
exports.mfzAvatarGender = function (attempt_id, success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzAvatarGender', [attempt_id]);
};
exports.mfzAvatarMeshCachedFile = function (attempt_id, success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzAvatarMeshCachedFile', [attempt_id]);
};
exports.mfzAvatarState = function (attempt_id, success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzAvatarState', [attempt_id]);
};
exports.mfzAvatarHeightInCm = function (attempt_id, success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzAvatarHeightInCm', [attempt_id]);
};
exports.mfzAvatarWeightInKg = function (attempt_id, success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzAvatarWeightInKg', [attempt_id]);
};
exports.mfzAvatarChestInCm = function (attempt_id, success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzAvatarChestInCm', [attempt_id]);
};
exports.mfzAvatarWaistInCm = function (attempt_id, success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzAvatarWaistInCm', [attempt_id]);
};
exports.mfzAvatarHipInCm = function (attempt_id, success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzAvatarHipInCm', [attempt_id]);
};
exports.mfzAvatarInseamInCm = function (attempt_id, success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzAvatarInseamInCm', [attempt_id]);
};
exports.mfzAvatarThighInCm = function (attempt_id, success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzAvatarThighInCm', [attempt_id]);
};

/* MyFiziqAvatarManager */
exports.mfzAvatarMgrRequestAvatars = function (success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzAvatarMgrRequestAvatars', []);
};
exports.mfzAvatarMgrDeleteAvatars = function (attempt_ids, success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzAvatarMgrDeleteAvatars', attempt_ids);
};
// Properties
exports.mfzAvatarMgrAllAvatars = function (success_cb, error_cb) {
    exec(success_cb, error_cb, 'cordova-plugin-myfiziq', 'mfzAvatarMgrAllAvatars', [new_height]);
};

package com.example.plugin;

import org.apache.cordova.*;
import org.json.JSONArray;
import org.json.JSONException;
import com.myfiziq.sdk.MyFiziqSdkCallback;
import com.myfiziq.sdk.MyFiziqSdkManager;

public class MFZPlugin extends CordovaPlugin
{
    @Override
    public boolean execute(String action, JSONArray data, final CallbackContext callbackContext) throws JSONException
    {
        return MyFiziqSdkManager.cordovaExecute(cordova.getActivity(), action, data, new MyFiziqSdkCallback()
        {
            void onError(String result)
            {
                callbackContext.error(result);
            }

            void onSuccess(String result)
            {
                callbackContext.success(result);
            }
        });
    }
}

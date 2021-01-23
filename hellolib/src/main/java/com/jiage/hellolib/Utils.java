package com.jiage.hellolib;

import android.util.Log;

public class Utils {
    public static String getLibDate() {
//        String date = BuildConfig.BUILD_TYPE;
        String date ="hellolib 5";
        Log.d("TAG", "hellolib date" + date);
        return date;
    }
}

package com.jiage.hellolib;

import android.util.Log;

public class Utils {
    public static String getLibDate() {
        String date = BuildConfig.VERSION_NAME;
//        String date ="hellolib 7";
        Log.d("TAG", "hellolib date" + date);
        return date;
    }
}

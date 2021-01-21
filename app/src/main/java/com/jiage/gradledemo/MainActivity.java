package com.jiage.gradledemo;


import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

import com.jiage.hellolib.Utils;

public class MainActivity extends Activity implements View.OnClickListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        String str = Utils.getLibDate();
        Toast.makeText(this, str, Toast.LENGTH_SHORT).show();
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.bt_call_hello_lib:
                String str = Utils.getLibDate();
                Toast.makeText(this, str, Toast.LENGTH_SHORT).show();
                break;
        }
    }
}
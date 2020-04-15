package com.example.flutterexample

import android.app.Application
import androidx.multidex.MultiDex
import io.flutter.app.FlutterApplication

class App : FlutterApplication() {
    override fun onCreate() {
        super.onCreate()
        // 初始化MultiDex
        MultiDex.install(this)
    }
}
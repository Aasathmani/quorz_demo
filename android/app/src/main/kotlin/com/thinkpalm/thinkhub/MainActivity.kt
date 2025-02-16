package com.app.qoruz

import android.os.Bundle

import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterFragmentActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        var methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "in_app_update");
        InAppUpdatePlugin(this, methodChannel)
    }
}

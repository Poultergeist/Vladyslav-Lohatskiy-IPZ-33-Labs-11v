package com.example.lab

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example/native_code"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getNativeDate") {
                val nativeDate = getNativeDate()
                result.success(nativeDate)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getNativeDate(): String {
        val timeFormat = SimpleDateFormat("dd.mm.yyyy", Locale.getDefault())
        return "Current date: ${timeFormat.format(Date())}"
    }
}
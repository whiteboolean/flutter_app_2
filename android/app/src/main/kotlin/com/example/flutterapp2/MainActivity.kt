package com.example.flutterapp2

import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AlertDialog
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)


        val methodChannel = MethodChannel(flutterEngine?.dartExecutor?.binaryMessenger, "com.example.platform_channel/dialog")
        methodChannel.setMethodCallHandler { call, result ->
            if ("dialog".equals(call.method)) {
                if (call.hasArgument("content")) {
                    showAlertDialog()
                    result.success("弹出成功")
                } else {
                    result.error("error", "弹出失败", "content is null")
                }
            } else {
                result.notImplemented()
            }
        }

    }

    private fun showAlertDialog() {

        val builder = androidx.appcompat.app.AlertDialog.Builder(this)
        builder.setPositiveButton("确定") { dialog, which ->
            Toast.makeText(this, "点击了确定", Toast.LENGTH_LONG).show()
        }.setTitle("Flutter调用Android").show()
    }
}

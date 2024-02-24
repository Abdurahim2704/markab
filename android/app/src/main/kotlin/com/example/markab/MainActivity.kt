package com.example.markab


import  androidx.annotation.NonNull
import  io.flutter.embedding.android.FlutterActivity
import  io.flutter.embedding.engine.FlutterEngine
import  io.flutter.plugins.GeneratedPluginRegistrant
import  com.yandex.mapkit.MapKitFactory

class  MainActivity: FlutterActivity(){
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine){
        MapKitFactory.setApiKey("bbd74df4-1a37-419e-94f7-ee9d18c44566")
        super.configureFlutterEngine(flutterEngine)
    }
}

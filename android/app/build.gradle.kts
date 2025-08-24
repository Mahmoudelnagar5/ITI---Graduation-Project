plugins {
    id("com.android.application")
    id("com.google.gms.google-services")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.final_project_iti"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion // ✅ صح بدل minSdkVersion

    compileOptions {
        isCoreLibraryDesugaringEnabled = true 
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.final_project_iti"
        minSdk = flutter.minSdkVersion     // ✅ استخدم minSdk
        targetSdk = flutter.targetSdkVersion  // ✅ استخدم targetSdk
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
   coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.5")
}

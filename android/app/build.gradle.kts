plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.drittelegiona.timetocode"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.drittelegiona.timetocode"
        minSdk        = flutter.minSdkVersion
        targetSdk     = flutter.targetSdkVersion
        versionCode   = flutter.versionCode
        versionName   = flutter.versionName
    }

    // 1) Definisikan signingConfigs
    signingConfigs {
        create("release") {
            storeFile     = file("drittelegiona.keystore")
            storePassword = "A3Solid"
            keyAlias      = "timetocode-keyapp"
            keyPassword   = "A3Solid"
        }
    }

    buildTypes {
        // 2) Konfigurasi buildTypes.release
        getByName("release") {
            signingConfig   = signingConfigs.getByName("release")
            isMinifyEnabled = false
            isShrinkResources = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
        // (opsional) debug tetap default
    }
}

flutter {
    source = "../.."
}

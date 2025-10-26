buildscript {
    // La version de Kotlin peut varier selon votre installation Flutter.
    ext["kotlin_version"] = "1.8.20"
    
    repositories {
        google()
        mavenCentral()
    }

    dependencies {
        // CORRECTION: Utilisation de la syntaxe Kotlin DSL (avec parenthèses) pour classpath.
        // Cela résout les erreurs "Unresolved reference" et "Unexpected tokens".
        classpath("com.android.tools.build:gradle:8.2.2")
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:${ext["kotlin_version"]}")
        
        // Ajouté pour Firebase (google-services), nécessaire si vous utilisez Firebase
        classpath("com.google.gms:google-services:4.3.15") 
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Nettoyage (suppression de l'ancien dossier de build)
tasks.register("clean", Delete::class) {
    delete(rootProject.layout.buildDirectory)
}
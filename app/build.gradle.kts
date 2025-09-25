plugins {
    // Apply the application plugin to add support for building a CLI application in Java.
    application
}

repositories {
    // Use Maven Central for resolving dependencies.
    mavenCentral()
}

dependencies {
    // This dependency is used by the application.
    implementation("com.google.guava:guava:32.1.3-jre")
    implementation("com.google.code.gson:gson:2.10.1")

    // Local JAR dependency
    implementation(files("libs/fastcgi-lib.jar"))
}

application {
    // Define the main class for the application.
    mainClass.set("web2.Main")
}

// Configure JAR packaging
tasks.jar {
    archiveBaseName.set("FcgiServer")
    archiveVersion.set("")

    manifest {
        attributes(
            "Main-Class" to application.mainClass.get()
        )
    }

    // Package dependencies (fat JAR / uber JAR)
    from({
        configurations.runtimeClasspath.get().filter { it.exists() }.map {
            if (it.isDirectory) it else zipTree(it)
        }
    })

    duplicatesStrategy = DuplicatesStrategy.EXCLUDE
}

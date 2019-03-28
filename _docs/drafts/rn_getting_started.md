---
title: Начало работы React Native
permalink:
sidebar:
product:
---

1. Выполните команду:

   ```
   react-native init YourProjectName
   ```

   Чтобы выполнить эту команду надо сделать то, что написано [здесь](https://facebook.github.io/react-native/docs/getting-started) на вкладке **Building Projects with Native Code**.

2. Перейдите в папку проекта:

   ```
   cd YourProjectName
   ```

3. Выполните команду:

   ```
   npm install
   ```

4. Выполните команду:

   ```
   npm install evotor-integration-library --save
   ```

5. Выполните команду:

   ```
   react-native link evotor-integration-library
   ```

6. В файле android\settings.gradle укажите (В ПРОТИВНОМ СЛУЧАЕ СЛЕШИ В ПУТИ НЕ В ТУ СТОРОНУ УКАЗАНЫ):

   ```
   rootProject.name = 'testapp'
   include ':evotor-integration-library'
   project(':evotor-integration-library').projectDir = new File(rootProject.projectDir, '../node_modules/evotor-   integration-library/android')

   include ':app'
   ```

7. В файле android\build.gradle укажите:

   ```
   allprojects {
    repositories {
        maven { url 'https://jitpack.io' }
        mavenLocal()
        google()
        jcenter()
        maven {
            // All of React Native (JS, Obj-C sources, Android binaries) is installed from npm
            url "$rootDir/../node_modules/react-native/android"
           }
       }
   }
   ```

8. В файле android\app\build.gradle укажите:

  ```
  minSdkVersion 22
  ```

9. Из раздела <application> файла AndroidManifest.xml удалите аттрибут:

   ```
   android:allowBackup="false"
   ```

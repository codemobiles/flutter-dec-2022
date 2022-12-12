#1 deployment
// macos
keytool -genkey -v -keystore /Users/iblurblur/Desktop/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
// windows
keytool -genkey -v -keystore c:\Users\iblurblur\Desktop\key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key

#2 check fluttet environment
flutter doctor -v

#3 Create a file named <app dir>/android/key.properties that contains a reference to your keystore
#4 <app dir>/android/app/build.gradle file.
#5 flutter build apk
#6 flutter build appbundle

- Setup Android Studio
  - Auto import
  - Plugin Flutter Enhancement Suite
  - Plugin Flutter Asset Auto complete

- Create project
- Set Android Product Structure
- Setup Image and Icons and configure in yumspec
  assets:
    - assets/images/

- Setup main.dart, app.dart, page folder
- Create configs and constants folder
- Configure Navigation

- Run Emulator in sidebar mode by opening Emulator right-sidetab
- Set pubspec.ymal
- Setup Demo Layout
- Remove comments
- Setup project structure
- Setup page navigation








Tip
- Remove comment : //.*
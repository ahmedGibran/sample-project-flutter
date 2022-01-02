pushd android
 flutter build apk
./gradlew app:assembleAndroidTest
./gradlew app:assembleDebug -Ptarget=integration_test/app_test.dart
popd

gcloud auth activate-service-account --key-file=samle-project-bb573-4ff5caf0b1bb.json
gcloud --quiet config set project samle-project-bb573

gcloud firebase test android run --type instrumentation \
 --app build/app/outputs/apk/debug/app-debug.apk \
 --test build/app/outputs/apk/androidTest/debug/app-debug-androidTest.apk \
 --device model=Nexus6,version=21,locale=en,orientation=portrait \
 --device model=Nexus7,version=19,locale=fr,orientation=landscape \
 --timeout 2m





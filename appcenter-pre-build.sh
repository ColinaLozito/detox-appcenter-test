if [ "$APPCENTER_BRANCH" = "master" ]; then

    export RN_SRC_EXT=e2e.js

    if [ "$OS" = "iOS" ]; then
        echo "iOS: Installing cocoapods..."
        npm run pod-install

        echo "iOS: Building the project for Detox tests..."
        npx detox build --configuration ios.sim.release --loglevel verbose

        echo "iOS: Executing Detox tests..."
        npx detox test --configuration ios.sim.release --cleanup --loglevel verbose
    else

        echo "Android: Building the project for Detox tests..."
        npx detox build --configuration android.emu.release --loglevel verbose

        echo "Android: Downloading android image..."
        /Users/runner/Library/Android/sdk/tools/bin/sdkmanager "system-images;android-27;default;x86_64"

        echo "Android: Accepting licenses for android images.."
        echo N | /Users/runner/Library/Android/sdk/tools/bin/sdkmanager --licenses
        touch /Users/runner/.android/repositories.cfg

        echo "Android: Creating AVD.."
        echo no | /Users/runner/Library/Android/sdk/tools/bin/avdmanager create avd -n Pixel_API_27_AOSP -d pixel --package "system-images;android-27;default;x86_64"
        cp app-center/config.ini /Users/runner/.android/avd/Pixel_API_27_AOSP.avd/config.ini

        echo "Android: Executing Detox tests..."
        npx detox test --configuration android.emu.release --headless --loglevel verbose
    fi
fi
if [ "$APPCENTER_BRANCH" = "master" ]; then

    export RN_SRC_EXT=e2e.js

    if [ "$OS" = "iOS" ]; then
        echo "iOS: Executing Detox tests..."
        npx detox test --configuration ios.sim.release --cleanup --loglevel verbose
    else
        echo "Android: Executing Detox tests..."
        npx detox test --configuration android.emu.release --headless --loglevel verbose
    fi
fi
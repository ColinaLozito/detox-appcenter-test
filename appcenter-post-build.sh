if [ "$APPCENTER_BRANCH" = "master" ]; then

    DETOX_CONFIG=ios.sim.release

    echo "Executing Detox tests..."

    npx detox test --configuration "$DETOX_CONFIG" --forceExit 
fi
function mobileHelp(){
  echo "Local files:"
  echo "  Android"
  echo "    > adb shell"
  echo "      run-as [app id]"
  echo "      ls files"
  echo "  iOS"
  echo '    > open open "$(xcrun simctl get_app_container booted [app identifier] data)'
  echo ""
  echo "Deeplinks:"
  echo "  > npx uri-scheme open [deeplink] --ios --android"
  echo ""
}

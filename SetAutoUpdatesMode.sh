#!/bin/bash
MODE=$1

if [[ ! $1 || ( $MODE != "Enable" && $MODE != "enable" && $MODE != "disable" && $MODE != "Disable") ]]; then
    echo "Error: '$1' is not a valid input, only Enable or Disable can be selected"
else
echo "Set Automatic Updates to '$1'"
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd\">
<plist version="1.0">
<dict>
        <key>/com/pingidentity/pingid/</key>
        <dict>
                <key>pctoken/</key>
                <dict>
                        <key>PRODUCTION/</key>
                        <dict>
                                <key>autoupdatemode</key>
                                <string>$MODE</string>
                        </dict>
                </dict>
        </dict>
</dict>
</plist>" > /Library/Preferences/com.pingidentity.pingid.plist
plutil -convert binary1 /Library/Preferences/com.pingidentity.pingid.plist
defaults import /Library/Preferences/com.pingidentity.pingid.plist /Library/Preferences/com.pingidentity.pingid.plist
fi

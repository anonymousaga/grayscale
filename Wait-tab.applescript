tell application "Finder" to set vv to version
if vv < 10.14 then
	display dialog "Grayscale is not compatible with macOS versions before Mojave 10.14"
else if vv < 13 then
	tell application "System Settings"
		set the current pane to pane id "com.apple.preference.universalaccess"
		delay 0.7 #needs time to open universal access
		tell application "System Events" to tell process "System Preferences" to tell window "Accessibility"
			select row 5 of table 1 of scroll area 1 #open display preferences
			click radio button "Color Filters" of tab group 1 of group 1
			click checkbox "Enable Color Filters" of tab group 1 of group 1
		end tell
	end tell
	tell application "System Settings" to quit
else
	do shell script "open -b com.apple.systempreferences " & ¬
		"/System/Library/PreferencePanes/UniversalAccessPref.prefPane"
	tell application "System Settings" to activate
	tell application "System Events"
		tell its application process "System Settings"
			repeat until (UI element 4 of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Accessibility" exists) or (checkbox 1 of group 4 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Display" exists)
				delay 0.1
			end repeat
			if (UI element 4 of group 1 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Accessibility" exists)
			click UI element 3 of group 1 of scroll area 1 of group 1 of group 2 ¬
				of splitter group 1 of group 1 of window "Accessibility"
			end if
			repeat until checkbox 1 of group 4 of scroll area 1 of group 1 ¬
				of group 2 of splitter group 1 of group 1 of window "Display" exists
				delay 0.1
			end repeat
			click checkbox 1 of group 4 of scroll area 1 of group 1 ¬
				of group 2 of splitter group 1 of group 1 of window "Display"
		end tell
	end tell
	tell application "System Settings" to quit
end if

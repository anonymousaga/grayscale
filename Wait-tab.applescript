do shell script "open -b com.apple.systempreferences " & Â
	"/System/Library/PreferencePanes/UniversalAccessPref.prefPane"
tell application "System Settings" to activate
tell application "System Events"
	tell its application process "System Settings"
		repeat until UI element 4 of group 1 of scroll area 1 of group 1 of Â
			group 2 of splitter group 1 of group 1 of window "Accessibility" exists
			delay 0.1
		end repeat
		click UI element 3 of group 1 of scroll area 1 of group 1 of group 2 Â
			of splitter group 1 of group 1 of window "Accessibility"
		repeat until checkbox 1 of group 4 of scroll area 1 of group 1 Â
			of group 2 of splitter group 1 of group 1 of window "Display" exists
			delay 0.1
		end repeat
		click checkbox 1 of group 4 of scroll area 1 of group 1 Â
			of group 2 of splitter group 1 of group 1 of window "Display"
	end tell
end tell
tell application "System Settings" to quit
-- Get primary window resolution
set monitor_width to (do shell script "system_profiler SPDisplaysDataType | awk '/Resolution/{print $4; exit}'")
set monitor_height to (do shell script "system_profiler SPDisplaysDataType | awk '/Resolution/{print $2; exit}'")

--Calculate the new window sizes
set window1_left to monitor_width * 0.01
set window1_top to monitor_height * 0.1
set window1_right to 100 + monitor_width * 0.4
set window1_bottom to monitor_height * 0.75

set window2_left to window1_right + 5
set window2_top to window1_top
set window2_right to window1_right * 2
set window2_bottom to window1_bottom

set the startup_disk to (path to startup disk)

tell application "Finder"
	activate
	-- set visible of (every process whose visible is true and frontmost is false) to false
	-- BOTTOM WINDOW
	if (count windows) is 0 then make new Finder window
	set window_left to make new Finder window
	-- set the target of this_window to the startup_disk
	set the bounds of window_left to {window1_left, window1_top, window1_right, window1_bottom}
	-- set the current view of this_window to column view
	-- BOTTOM WINDOW
	set window_right to make new Finder window
	-- set the target of this_window to the startup_disk
	set the bounds of window_right to {window2_left, window2_top, window2_right, window2_bottom}
	-- set the current view of this_window to column view
end tell

-- Notes on bounds:
-- bounds {72, 90, 512, 481}
-- (72) The distance in pixels from the left side of the screen to the left side of the Finder window.
-- (90) The distance in pixels from the top of the screen to the top of the Finder window.
-- (512) The distance in pixels from the left side of the screen to the right side of the Finder window.
-- (481) The distance in pixels from the top of the screen to the bottom of the Finder window.

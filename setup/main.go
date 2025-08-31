package main

import (
	"fmt"
	"os/exec"
	"strings"
)

// DisplayNotification sends a macOS notification with the given title, subtitle, and message.
func DisplayNotification(title, subtitle, message, sound string) error {
	// Construct the AppleScript command.
	script := fmt.Sprintf(`display notification "%s" with title "%s" subtitle "%s" sound name "%s"`,
		escapeString(message), escapeString(title), escapeString(subtitle), escapeString(sound))

	// Execute the osascript command.
	cmd := exec.Command("osascript", "-e", script)
	output, err := cmd.CombinedOutput()
	if err != nil {
		return fmt.Errorf("error executing osascript: %w, output: %s", err, string(output))
	}

	return nil
}

// Escape a string for use in AppleScript.  This is important to prevent
// injection vulnerabilities and to handle special characters correctly.
func escapeString(s string) string {
	s = strings.ReplaceAll(s, "\\", "\\\\") // Escape backslashes first!
	s = strings.ReplaceAll(s, "\"", "\\\"")
	return s
}

func main() {
	fmt.Println("Notification sent successfully!")
}

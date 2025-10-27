#!/usr/bin/env bash
# wait_until.sh
# Usage: ./wait_until.sh "YYYY-MM-DD HH:MM:SS"
# Sleeps until the specified future date, or exits with an error if the date is in the past or invalid.
# All output is routed to stderr.

# --- Date Command Setup (Prioritize gdate for macOS portability) ---

# Check if the GNU version of date (often aliased as gdate on non-GNU systems) is available.
if command -v gdate >/dev/null 2>&1; then
    DATE_CMD="gdate"
else
    # Fall back to the system's default date command (assumes GNU date on Linux, or will fail later on BSD/macOS if gdate isn't present).
    DATE_CMD="date"
fi

# --- Configuration and Argument Check ---

TARGET_DATE="$1"

# Check if an argument was provided
if [ -z "$TARGET_DATE" ]; then
    echo "Error: Please provide a target date string." >&2
    echo "Example: ./wait_until.sh 'tomorrow 9am'" >&2
    exit 1
fi

# --- Date Calculation ---

# Get the current Unix timestamp (seconds since epoch) using the determined command.
CURRENT_TS=$("$DATE_CMD" +%s)

# Attempt to convert the target date string to a Unix timestamp using the -d flag.
# We redirect stderr to /dev/null to suppress error messages for invalid dates during the check.
TARGET_TS=$("$DATE_CMD" -d "$TARGET_DATE" +%s 2>/dev/null)
DATE_STATUS=$?

# Check if the date conversion failed (invalid date string)
if [ $DATE_STATUS -ne 0 ]; then
    echo "Error: Invalid date format or unrecognized date string: '$TARGET_DATE'. (Check if '$DATE_CMD' supports the required -d flag)." >&2
    exit 1
fi

# Calculate the difference in seconds
SECONDS_TO_SLEEP=$((TARGET_TS - CURRENT_TS))

# --- Conditional Exit or Sleep ---

# If SECONDS_TO_SLEEP is negative, the date is in the past.
if [ "$SECONDS_TO_SLEEP" -lt 0 ]; then
    # Output the required error message to standard error and exit with a non-zero code
    echo "date in the past" >&2
    exit 2
fi

# If the date is valid and in the future, print status and sleep.
# ALL informational output is now redirected to stderr (>&2)
echo "Target date: $("$DATE_CMD" -d @"$TARGET_TS")" >&2
echo "Current time: $("$DATE_CMD" -d @"$CURRENT_TS")" >&2
echo "Sleeping for $SECONDS_TO_SLEEP seconds..." >&2

sleep "$SECONDS_TO_SLEEP"

echo "Target time reached. Exiting normally." >&2
exit 0


#!/bin/bash

# change these to change what to test
SOURCE_FILE="$HOME/codingHub/learning/DSAgrind/testScripts/testSourceCode/main.cpp"  # absolute path worked relative didn't 
TEST_FILE="$HOME/codingHub/learning/DSAgrind/testScripts/test.txt"  
EXECUTABLE="./solution"


set -uo pipefail # to safeguard and what to show on errors during piping.

# Check that required files exist.
if [[ ! -f "$SOURCE_FILE" ]]; then
    echo "Error: C++ source file not found: $SOURCE_FILE" >&2
    exit 1
fi

if [[ ! -f "$TEST_FILE" ]]; then
    echo "Error: Test file not found: $TEST_FILE" >&2
    exit 1
fi


# Compile the C++ program once.
echo "Compiling $SOURCE_FILE..."

if ! g++ -std=c++17 -O2 -Wall -Wextra \
    "$SOURCE_FILE" -o "$EXECUTABLE"; then
    echo "Compilation failed." >&2
    exit 1
fi

echo "Compilation successful."

# Create a temporary directory for individual test cases.
TEMP_DIR=$(mktemp -d)
trap 'rm -rf "$TEMP_DIR"' EXIT

# Split test.txt wherever a line contains only ---
# Empty sections are ignored.
awk -v dir="$TEMP_DIR" '
function flush_case() {
    if (has_content) {
        count++
        output = sprintf("%s/case_%04d.txt", dir, count)
        printf "%s", buffer > output
        close(output)
    }
    buffer = ""
    has_content = 0
}

/^[[:space:]]*---[[:space:]]*$/ {
    flush_case()
    next
}

{
    buffer = buffer $0 "\n"

    # A case must contain at least one non-whitespace character.
    if ($0 ~ /[^[:space:]]/) {
        has_content = 1
    }
}

END {
    flush_case()
    print count + 0 > (dir "/count")
    close(dir "/count")
}
' "$TEST_FILE"

TOTAL=$(<"$TEMP_DIR/count")

if (( TOTAL == 0 )); then
    echo "No test cases found in $TEST_FILE." >&2
    exit 1
fi

echo "Found $TOTAL test case(s)."

# Run each test case as a separate execution.
PASSED_RUNS=0
FAILED_RUNS=0

for ((i = 1; i <= TOTAL; i++)); do
    CASE_FILE=$(printf "%s/case_%04d.txt" "$TEMP_DIR" "$i")

    echo "_________________________________"
    echo "# Test Case $i / $TOTAL"
    echo "_________________________________"
    echo "Input :"
    cat "$CASE_FILE"
    echo "_________________________________"
    echo "Output :"
    

    if "$EXECUTABLE" < "$CASE_FILE"; then
        echo ""
        ((PASSED_RUNS += 1))
    else
        STATUS=$?
        echo
        echo "!! Execution failed with exit code : $STATUS !!"
        ((FAILED_RUNS += 1))
    fi
done

echo
echo "SUMMARY:"
echo "--------------------------------"
echo "Total cases: $TOTAL"
echo "Completed successfully: $PASSED_RUNS"
echo "Execution failures: $FAILED_RUNS"

if (( FAILED_RUNS > 0 )); then
    exit 1
fi

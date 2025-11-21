# Bug Reproduction: Dart MCP Test Tool Path Filtering Issue

## Problem
The Dart MCP server's `run_tests` tool runs ALL tests in ALL files for the given roots, even when the "paths" parameter specifies only a subset (e.g., a single file).

## Test Setup
This project contains two simple test files:
- `test/test_a.dart` - Contains a test named "Test from test_a.dart"
- `test/test_b.dart` - Contains a test named "Test from test_b.dart"

## How to Reproduce

### Expected Behavior
When running tests with `paths` set to only `test/test_a.dart`, only that file should run, and you should see only one test: "Test from test_a.dart".

### Actual Behavior (Bug)
When running tests with `paths` set to only `test/test_a.dart`, both test files run, and you'll see both tests in the output:
- "Test from test_a.dart"
- "Test from test_b.dart"

### Steps to Reproduce
1. Use the Dart MCP `run_tests` tool with:
   - `roots`: `[{ "root": "file:///Users/petertrost/dev/dart_mcp_test_tool_bug" }]`
   - `paths`: `["test/test_a.dart"]`

2. Observe that both `test_a.dart` and `test_b.dart` run (you'll see both test names in the output)

### Verification
You can verify the bug by checking the test output:
- If only `test_a.dart` runs: You'll see only "Test from test_a.dart"
- If both run (bug): You'll see both "Test from test_a.dart" and "Test from test_b.dart" in the output

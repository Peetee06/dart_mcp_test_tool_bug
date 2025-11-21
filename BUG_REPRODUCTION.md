# Bug Reproduction: Dart MCP Test Tool Path Filtering Issue

## Problem
The Dart MCP server's `run_tests` tool runs ALL tests in ALL files for the given roots, even when the "paths" parameter specifies only a subset (e.g., a single file).

## Test Setup
This project contains two test files:
- `test/fast_test.dart` - A test that completes immediately
- `test/slow_test.dart` - A test that takes 5 seconds to complete (uses `Future.delayed`)

## How to Reproduce

### Expected Behavior
When running tests with `paths` set to only `test/fast_test.dart`, only that file should run, completing in < 1 second.

### Actual Behavior (Bug)
When running tests with `paths` set to only `test/fast_test.dart`, both test files run, causing the test suite to take ~5 seconds (the duration of the slow test).

### Steps to Reproduce
1. Use the Dart MCP `run_tests` tool with:
   - `roots`: `[{ "root": "file:///Users/petertrost/dev/dart_mcp_test_tool_bug" }]`
   - `paths`: `["test/fast_test.dart"]`

2. Observe that both `fast_test.dart` and `slow_test.dart` run (you'll see print statements from both)

3. The test execution takes ~5 seconds instead of < 1 second, indicating the slow test is also running

### Verification
You can verify the bug by checking the console output:
- If only `fast_test.dart` runs: You'll see "Fast test started" and "Fast test completed" only
- If both run (bug): You'll see print statements from both files, and the execution time will be ~5 seconds

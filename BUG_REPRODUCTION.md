# Bug Reproduction: Dart MCP Test Tool Path Filtering Issue

## Problem
The Dart MCP server's `run_tests` tool runs ALL tests in ALL files for the given roots, even when the "paths" parameter specifies only a subset (e.g., a single file).

## Test Setup
This project contains two simple test files:
- `test/test_a_test.dart` - Contains a test named "Test from test_a_test.dart"
- `test/test_b_test.dart` - Contains a test named "Test from test_b_test.dart"

## How to Reproduce

### Expected Behavior
When running tests with `paths` set to only `test/test_a_test.dart`, only that file should run, and you should see only one test: "Test from test_a_test.dart".

### Actual Behavior (Bug)
When running tests with `paths` set to only `test/test_a_test.dart`, both test files run, and you'll see both tests in the output:
- "Test from test_a_test.dart"
- "Test from test_b_test.dart"

### Steps to Reproduce
1. Use the Dart MCP `run_tests` tool with:
   - `roots`: `[{ "root": "file:///Users/petertrost/dev/dart_mcp_test_tool_bug" }]`
   - `paths`: `["test/test_a_test.dart"]`

2. Observe that both `test_a_test.dart` and `test_b_test.dart` run (you'll see both test names in the output)

### Verification
You can verify the bug by checking the test output:
- If only `test_a_test.dart` runs: You'll see only "Test from test_a_test.dart"
- If both run (bug): You'll see both "Test from test_a_test.dart" and "Test from test_b_test.dart" in the output

## Additional Bug: Non-existent Paths

The bug also occurs when specifying a non-existent test file path.

### Steps to Reproduce
1. Use the Dart MCP `run_tests` tool with:
   - `roots`: `[{ "root": "file:///Users/petertrost/dev/dart_mcp_test_tool_bug" }]`
   - `paths`: `["test/nonexistent_test.dart"]`

2. Observe that all tests run despite the file not existing

### Expected Behavior
The tool should either:
- Return an error indicating the file doesn't exist, OR
- Run no tests (since the specified file doesn't exist)

### Actual Behavior (Bug)
All tests in the project run, and the tool reports "All tests passed!" as if the non-existent path was valid.

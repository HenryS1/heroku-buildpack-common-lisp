#!/bin/sh

# shellcheck disable=SC1090
. "${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh"

testCompile() {
  cp -R "${BUILDPACK_HOME}"/test/fixtures/ccl/* "${BUILD_DIR}"
  compile

  if [ -f "$BUILD_DIR/lispapp" ]; then
    LISPAPP_FOUND=1
  fi

  assertEquals 'lispapp binary was not compiled' 1 "$LISPAPP_FOUND"
}
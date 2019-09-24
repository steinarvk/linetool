setup() {
  export ADDLINES_TESTDIR="${BATS_TMPDIR}/addlines-test"
  mkdir -p "${ADDLINES_TESTDIR}"
}

teardown() {
  if [[ -n "${ADDLINES_TESTDIR}" ]]; then
    rm -rf "${ADDLINES_TESTDIR}"
  fi
}

@test "can create a new file" {
  [ ! -f "${ADDLINES_TESTDIR}/newfile" ]
  echo hello | ./linetool add "${ADDLINES_TESTDIR}/newfile"
  [ -f "${ADDLINES_TESTDIR}/newfile" ]
}

@test "can add multiple lines to a file" {
  seq 100 | ./linetool add "${ADDLINES_TESTDIR}/file"
  echo hello | ./linetool add "${ADDLINES_TESTDIR}/file"
  [ "$(cat "${ADDLINES_TESTDIR}/file" | wc -l)" = "101" ]
}

@test "will not add duplicate lines to a file" {
  seq 100 | ./linetool add "${ADDLINES_TESTDIR}/file"
  echo 42 | ./linetool add "${ADDLINES_TESTDIR}/file"
  [ "$(cat "${ADDLINES_TESTDIR}/file" | wc -l)" = "100" ]
}

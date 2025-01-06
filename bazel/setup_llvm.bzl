"""Configure LLVM Bazel overlays from a 'raw' imported llvm repository"""

load("@llvm-raw//utils/bazel:configure.bzl", "llvm_configure")

# The subset of LLVM backend targets that should be compiled
_LLVM_TARGETS = [
    "X86",
    # Needed for Apple M1 targets, see
    # https://github.com/j2kun/mlir-tutorial/issues/11
    "AArch64",
]

def setup_llvm(name):
    """Build @llvm-project from @llvm-raw using the upstream bazel overlays."""
    llvm_configure(
        name = name,
        targets = _LLVM_TARGETS,
    )

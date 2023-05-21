import os
import osproc

setControlCHook(proc () {.noconv.} = discard)

let GIT_PATH = os.getAppDir().joinPath("../app/cmd/git.exe")
let SSH_WRAPPER_PATH = os.getAppDir().joinPath("./ssh_wrapper.cmd")

# we need to set HOME to config dir, otherwise git would pollute our home dir
putEnv("REAL_HOME", getEnv("HOME"))
putEnv("HOME", "D:\\_\\git\\config")

# git also adds custom paths to PATH, which changes which SSH is used when ssh.exe is called,
#  so we need to reset it before calling ssh in our wrapper
putEnv("ORIG_PATH", getEnv("PATH"))
# tell git to use our custom SSH wrapper, which resets HOME to original value
putEnv("GIT_SSH", SSH_WRAPPER_PATH)

osproc.startProcess(GIT_PATH, args = os.commandLineParams(), options = {poParentStreams, poInteractive})
    .waitForExit()
    .quit()

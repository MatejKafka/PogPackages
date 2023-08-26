import os
import osproc

setControlCHook(proc () {.noconv.} = discard)

let rootDir = os.getAppDir().joinPath("..")

let GIT_PATH = rootDir.joinPath("app/cmd/git.exe")
let SSH_WRAPPER_PATH = rootDir.joinPath(".pog/ssh_wrapper.cmd")

# prevent Git from looking for systemwide config
putEnv("GIT_CONFIG_NOSYSTEM", "1")

# we need to set HOME to config dir, otherwise git would pollute our home dir
putEnv("REAL_HOME", getEnv("HOME"))
putEnv("HOME", rootDir.joinPath("config"))

# tell git to use our custom SSH wrapper, which resets HOME to original value
putEnv("GIT_SSH", SSH_WRAPPER_PATH)
# git also adds custom paths to PATH, which changes which SSH is used when ssh.exe is called,
#  so we need to reset it before calling ssh in our wrapper
putEnv("ORIG_PATH", getEnv("PATH"))

osproc.startProcess(GIT_PATH, args = os.commandLineParams(), options = {poParentStreams, poInteractive})
    .waitForExit()
    .quit()

import XMonad
import qualified XMonad.StackSet as W
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import Graphics.X11.ExtraTypes.XF86
import System.IO

myTerminal = "konsole"

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig {
        manageHook = manageDocks <+> manageHook defaultConfig,
        layoutHook = avoidStruts  $  layoutHook defaultConfig,
        handleEventHook = handleEventHook defaultConfig <+> docksEventHook,
        logHook = dynamicLogWithPP xmobarPP {
          ppOutput = hPutStrLn xmproc,
          ppTitle = xmobarColor "lightblue" "" . shorten 50
        },
        terminal = myTerminal
        --, modMask = mod4Mask --Rebind Mod to the Windows Key
        } `additionalKeys`
        [
            ((mod4Mask, xK_i), spawn "xscreensaver-command -activate"),
            ((mod4Mask, xK_j), windows W.focusDown),
            ((mod4Mask, xK_k), windows W.focusUp),
            ((mod4Mask, xK_k), windows W.focusUp),
            ((mod4Mask, xK_space), sendMessage NextLayout),
            ((mod4Mask, xK_l), spawn "xscreensaver-command -lock"),
            ((mod4Mask, xK_s), spawn "import ~/Pictures/Screenshots/$(date +%m-%d-%yT%H.%M.%S).jpg"),
            ((mod4Mask, xK_1), spawn "vivaldi"),
            ((mod4Mask, xK_2), spawn "_JAVA_AWT_WM_NONREPARENTING=1 pycharm"),
            ((mod4Mask, xK_3), spawn "google-chrome-stable"),
            ((mod4Mask, xK_F11), spawn "toggle_compositor"),
            ((mod4Mask, xK_F12), spawn "toggle_xautolock"),
            ((0, 0x1008ff11), spawn "amixer sset Master 5%-"),
            ((0, 0x1008ff13), spawn "amixer sset Master 5%+"),
            ((0, 0x1008ff12), spawn "amixer sset Master toggle"),
            ((0, 0x1008ff2f), spawn "sudo /usr/sbin/pm-suspend")
        ]

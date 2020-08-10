import XMonad
import XMonad.Config.Desktop(desktopConfig)
import qualified XMonad.StackSet as W
import XMonad.Actions.MouseResize
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers(doFullFloat,isFullscreen)
import XMonad.Hooks.EwmhDesktops(fullscreenEventHook,ewmh)
import XMonad.Util.Scratchpad
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeysP)
import Graphics.X11.ExtraTypes.XF86
import System.IO

myTerminal = "konsole"

myKeys = 
    -- Misc Hotkeys
    [ ("M-i", spawn "xscreensaver-command -activate")
    , ("M1-<Space>", sendMessage NextLayout)
    , ("M-s", spawn "import ~/Pictures/Screenshots/$(date +%m-%d-%yT%H.%M.%S).jpg")

    -- Hotbar Programs
    -- , ("M1-1", spawn "vivaldi")

    --Toggles
    , ("M-<F7>", spawn "notify-send DUNST_COMMAND_TOGGLE")
    , ("M-<F8>", spawn "toggle_vpn")
    , ("M-<F10>", spawn "toggle_xscreensaver")
    , ("M-<F11>", spawn "toggle_compositor")
    , ("M-<F12>", spawn "toggle_xautolock")

    -- Sound
    , ("<XF86AudioLowerVolume>", spawn "amixer sset Master 5%- unmute")
    , ("<XF86AudioRaiseVolume>", spawn "amixer sset Master 5%+ unmute")
    , ("<XF86AudioMute>",   spawn "amixer set Master toggle")  -- Bug prevents it from toggling correctly in 12.04.
    -- , ("<XF86AudioNext>", spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.ncspot /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next")
    -- , ("<XF86AudioPrev>", spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.ncspot /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous")
    -- , ("<XF86AudioPlay>", spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.ncspot /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause")
    , ("<XF86AudioNext>", spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next")
    , ("<XF86AudioPrev>", spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous")
    , ("<XF86AudioPlay>", spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause")

    -- Scratchpad
    , ("M-<F9>", scratchPad)

    ]
    where

    scratchPad = scratchpadSpawnActionTerminal "konsole -e mutt"

manageScratchPad :: ManageHook
manageScratchPad = scratchpadManageHook (W.RationalRect l t w h)

  where
    
    h = 0.9
    w = 0.9
    t = 0.95 - h
    l = 0.95 - w

myLayoutHook = mouseResize $ spacing 2 $ layoutHook desktopConfig

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ ewmh $ desktopConfig {
        manageHook = manageDocks <+> manageHook desktopConfig <+> (isFullscreen --> doFullFloat) <+> manageScratchPad
        , layoutHook = myLayoutHook
        , borderWidth        = 2
        , normalBorderColor  = "#292d3e"
        , focusedBorderColor = "#bbc5ff"
        , handleEventHook = handleEventHook desktopConfig <+> fullscreenEventHook
        , startupHook = do spawn "~/.xmonad/startup.sh"
        , logHook = dynamicLogWithPP xmobarPP {
            ppOutput = hPutStrLn xmproc
            , ppTitle = xmobarColor "lightblue" "" . shorten 50
            , ppHidden = noScratchPad
        }
        ,terminal = myTerminal
        -- Run xmodmap to get mod key possibilities
        , modMask = mod4Mask --Rebind Mod to the Meta Key
        } `additionalKeysP` myKeys

        where

          noScratchPad ws = if ws == "NSP" then "" else ws

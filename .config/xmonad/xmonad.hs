import System.Exit (exitSuccess)
import XMonad

import XMonad.Actions.CopyWindow (kill1)

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

import XMonad.Layout.LayoutModifier
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.Spacing

import XMonad.Util.Cursor
import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.NamedActions
import XMonad.Util.Run
import XMonad.Util.SpawnOnce

import Colors.RosePine

myTerm :: String
myTerm = "alacritty"

myWeb :: String
myWeb = "firefox"

myEdit :: String
myEdit = "alacritty -e nvim"

myScreenShot :: String
myScreenShot = "mss" 

myBorderW :: Dimension
myBorderW = 1

myNormC :: String
myNormC = color1

myFocusC :: String
myFocusC = color3

mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw True (Border i i i i) True (Border i i i i) True

myLayouts =  lessBorders (Combine Union Screen OnlyFloat) tiled ||| Mirror tiled ||| Full
  where
    tiled = Tall nmaster delta ratio
    nmaster = 1
    ratio = 1 / 2
    delta = 3 / 100

main :: IO ()
main = xmonad
    . withEasySB (mySB1 <> mySB2) defToggleStrutsKey
    . ewmh
    . ewmhFullscreen
    $ myConfig

myConfig = def
    { modMask = mod4Mask
    , startupHook = myStart
    , layoutHook = mySpacing 5 $ myLayouts
    , borderWidth = myBorderW
    , normalBorderColor = myNormC
    , focusedBorderColor = myFocusC
    } `additionalKeysP` myKeys

myStart :: X ()
myStart = do
    setDefaultCursor xC_left_ptr

mySB1 = statusBarProp "xmobar -x 0 ~/.config/xmonad/xmobar.hs" (pure myXmobarPP)
mySB2 = statusBarProp "xmobar -x 1 ~/.config/xmonad/xmobar.hs" (pure myXmobarPP)

myXmobarPP :: PP
myXmobarPP = def
        { ppSep = magenta " • "
        , ppTitleSanitize = xmobarStrip
        , ppVisible = wrap " " "" . magenta
        , ppCurrent = wrap " " "" . xmobarBorder "Top" color7 2
        , ppHidden = white . wrap " " ""
        , ppHiddenNoWindows = lowWhite . wrap " " ""
        , ppUrgent = red . wrap (yellow "!") (yellow "!")
        , ppOrder = \[ws, l, _, wins] -> [ws, l, wins]
        , ppExtras = [logTitles formatFocused formatUnfocused]
        }
    where
        formatFocused = wrap (white "[") (white "]") . magenta . ppWindow
        formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue . ppWindow
        ppWindow :: String -> String
        ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 50
        blue, lowWhite, magenta, red, white, yellow :: String -> String
        magenta = xmobarColor color5 ""
        blue = xmobarColor color8 ""
        white = xmobarColor color2 ""
        yellow = xmobarColor color4 ""
        red = xmobarColor color3 ""
        lowWhite = xmobarColor color7 ""

myKeys =
    [ ("M-C-r", spawn "xmonad --recompile && xmonad --restart")
    , ("M-S-q", io exitSuccess)
    , ("M-S-c", kill1)
    , ("M-<Return>", spawn (myTerm))
    , ("M-w", spawn (myWeb))
    , ("M-e", spawn (myEdit))
    , ("M-S-s", spawn (myScreenShot))
    ]

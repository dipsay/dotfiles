import Xmobar

import Colors.RosePine

config :: Config
config = defaultConfig {
  font = "xft:Fira Code-9"
  , additionalFonts = ["xft:Hack Nerd Font-10"]
  , bgColor = color1
  , fgColor = color2
  , alpha = 242
  , allDesktops = True
  , overrideRedirect = False
  , position = Top
  , commands = [ Run $ Date "%a %b %_d %Y %H:%M:%S" "date" 10
               , Run $ XMonadLog
               , Run $ Cpu ["-L","3","-H","50"] 10
               , Run $ Memory ["-t","Mem: <usedratio>%"] 10
               ]
  , sepChar = "%"
  , alignSep = "}{"
  , template = " <fn=1>\xf0c92</fn> %XMonadLog% }{ %memory% | %cpu% | %date% "
  }

main :: IO ()
main = configFromArgs config >>= xmobar

import Xmobar

import Colors.RosePine

config :: Config
config = defaultConfig {
  font = "xft:Fira Colde-10"
  , bgColor = color1
  , fgColor = color2
  , position = Top
  , commands = [ Run $ Date "%a %b %_d %Y %H:%M:%S" "date" 10
               , Run $ StdinReader
               ]
  , sepChar = "%"
  , alignSep = "}{"
  , template = "%StdinReader% | }{ %date%"
  }

main :: IO ()
main = configFromArgs config >>= xmobar

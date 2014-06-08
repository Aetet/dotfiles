-- -- It overrides a few basic settings, reusing all the other defaults.
-- --
--
import XMonad
import XMonad.Actions.CopyWindow
import XMonad.Hooks.SetWMName
import qualified XMonad.StackSet as W 
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

myManageHooks = composeAll 
	[className =? "Xfce4-notifyd" --> doF W.focusDown]
main = do
xmproc <- spawnPipe "xmobar"
xmonad $ defaultConfig
	{ 
     startupHook = setWMName "LG3D",
     manageHook = manageDocks <+> myManageHooks 
	, layoutHook = avoidStruts $ layoutHook defaultConfig
	, logHook = dynamicLogWithPP xmobarPP
		{ ppOutput = hPutStrLn xmproc
		, ppTitle = xmobarColor "green" "" . shorten 50
		}
	, borderWidth = 2
	, modMask = mod4Mask
	, terminal = "x-terminal-emulator"
	, normalBorderColor = "#cccccc"
	, focusedBorderColor = "#cd8b00" } `additionalKeys`
	[
		--use xev to know keycode
      ((0, 0x1008FF12), spawn "amixer -D set Master toggle")
    , ((0, xK_Print), spawn "scrot -e 'mv $f ~/shots/'")
    , ((mod4Mask .|. shiftMask, xK_s), spawn "sudo /etc/acpi/sleep.sh")    
    , ((0, 0x1008FF11), spawn "amixer -q set Master 10%-")
    , ((0, 0x1008FF13), spawn "amixer -q set Master 10%+")
	]

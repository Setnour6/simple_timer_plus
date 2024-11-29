# Simple Timer Plus
A modified version of Simple Timer for Garry's Mod

By convention, the change notes in the workshop are to include all known changes with each update, in dash point format that briefly summarizes each change (i.e. "- Added a new font: newfont").

Workshop Link: https://steamcommunity.com/sharedfiles/filedetails/?id=3341835226

### How to Use

1. Either download the workshop addon, or download this repository or clone it to your Garry's Mod program folder and into your 'garrysmod' folder followed by the addons folder, making sure it is inside another folder with the name "simple_timer_plus" (i.e. `steamapps/common/Garry's Mod/garrysmod/addons/simple_timer_plus`)
2. Start Garry's Mod and start a new sandbox session
3. Press Q or any other button you have set to open the sandbox menu
4. In "Entites" --> "Fun + Games", you will see Simple Timer Plus.

### Workshop Description

[h2] Please unsubscribe to the original Simple Timer addon before using this [/h2]

Basically Simple Timer ( https://steamcommunity.com/sharedfiles/filedetails/?id=2895802066 ) but with more features!

[b]Alongside the original Simple Timer, you also get[/b]:
- Multiple Fonts to Select from. Default: Tahoma.
- Timer GUI Fade In/Out (The larger the value, the faster the fade time). Default: 0.05 Fade-In and 0.025 Fade-Out.
- Options to Change Timer Start/Stop/End sounds. Defaults: Default Start, Default Stop, Default End.
- An Option to Hide the Time from the Timer. Default: Disabled
- An Option to Hide the Timer Itself. Default: Disabled
- The Ability to use Console Commands to Change the Timer Entity.
- Presets, which can be applied by using the associated console command (see Console Commands section below)

[h3] Console Commands [/h3]
<> denotes command usage choice. input is only for setters or when prompted.

[b] Base Timer Entity Options [/b]
- simpletimerplus_<get/set>name - gets or changes the name of the timer (input: text)
- simpletimerplus_<get/set>color - gets or changes the color of the timer texts (input: number, number, number)
- simpletimerplus_settime - gets or changes the time of the timer in seconds (input: number)
- simpletimerplus_nohud - toggles the timer HUD to be disabled (default: false)
- simpletimerplus_nosound - toggles the timer sound to be disabled (default: false)
- simpletimerplus_notext - toggles chat messages regarding the timer when it's state changes (default: true)
- simpletimerplus_<get/set>startevent - gets or changes the start event on the timer (input: number, corresponding to value)
- simpletimerplus_<get/set>stopevent - gets or changes the stop event on the timer (input: number, corresponding to value)
- simpletimerplus_<get/set>endevent - gets or changes the end event on the timer (input: number, corresponding to value)
- simpletimerplus_<get/set>mission - gets or changes the mission on the timer (input: number, corresponding to value)
- simpletimerplus_<get/set>missionevent - gets or changes the mission event on the timer (input: number, corresponding to value)
- simpletimerplus_<get/set>aftermission - gets or changes the after-mission event for the timer (input: number, corresponding to value)
- simpletimerplus_<get/set>aftertimer - gets or changes the aftermath of the timer (input: number, corresponding to value)

[b] Plus Timer Entity Options [/b]
- simpletimerplus_getinfo - gets all of the info set of the timer entity.
- simpletimerplus_<get/set>currenttime - gets or changes the current running time on the timer (input: number with decimals)
- simpletimerplus_<get/set>state - gets or changes the state of the timer (input: number, corresponding to value)
- simpletimerplus_<get/set>font - gets or changes the font used for the texts (input: text)
- simpletimerplus_hidetimer - toggles the timer time text display (timer title remains unaffected) (default: false)
- simpletimerplus_<get/set>startsound - gets or changes the start sound of the timer (input: number, corresponding to value)
- simpletimerplus_<get/set>stopsound - gets or changes the stop sound of the timer (input: number, corresponding to value)
- simpletimerplus_<get/set>endsound - gets or changes the end sound of the timer (input: number, corresponding to value)
- simpletimerplus_<get/set>fadeintime - gets or changes the HUD fade-in time (input: number with decimals)
- simpletimerplus_<get/set>fadeouttime - gets or changes the HUD fade-out time (input: number with decimals)
- simpletimerplus_justifytext - toggles font alignment on some fonts to prevent timer text from jittering (default: false)
- simpletimerplus_hideentity - toggles the timer entity display in the world (default: false)
- simpletimerplus_setpreset - changes the timer values based on a given preset (input: text, corresponding to value) [Admin Only]

[b] Want to try to recreate the Pill Pack Hide and Seek formula on the timer? [/b]
Set the timer name to "Hide and Seek", the timer color to "1.000 0.000 0.000", the time to 600 seconds (or 630 seconds), the Custom Font to "Misery", the Fade In Time to 1.00, the Realign Timer toggle to "Checked/Enabled", the Start Sound to "PPHNS Round Start", the Stop Sound to "FNAF 3 Night Start" (optional but preferred), the End Sound to "PPHNS Round End (Any type)", and that's it.

Alternatively, you can use the simpletimerplus_setpreset console command to change the timer text appearance to match the Pill Pack Hide and Seek timer display. Sadly, it does not come with visual text effects (because I don't know how to make that happen).

[h1] Credits [/h1]
LemonCola3424 - Creator of Simple Timer
Setnour6 - Adjustments, Mod Publisher
DarkStar - Sound Contributor

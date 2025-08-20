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

[h2] Please unsubscribe to the original Simple Timer addon before using this. [/h2]

As seen in the Eddygar, Gentoi, Zoom, BlastNit, LmaoMonster, Meedy videos of their Pill Pack Hide and Seek content.

Basically Simple Timer ( https://steamcommunity.com/sharedfiles/filedetails/?id=2895802066 ) but with more features!

[b]Alongside the original Simple Timer, you also get[/b]:
- Multiple Fonts to Select from. Default: Tahoma.
- Complete Control over the Textbox.
- Timer GUI Fade In/Out (The larger the value, the faster the fade time). Default: 0.05 Fade-In and 0.025 Fade-Out.
- Options to change the timer position.
- Options to Change Timer Start/Stop/End Sounds. Defaults: Default Start, Default Stop, Default End.
- An Option to Include Secondary Start Sounds. Default: None.
- An Option to Hide the Time from the Timer. Default: Disabled
- An Option to Hide the Timer Itself. Default: Disabled
- The Ability to use Console Commands to Change the Timer Entity.
- Presets, which can be applied by using the associated console command (see Console Commands section below)
- Options to utilize effects for the text, such as Gradients and Glitchy Text. Defaults: Disabled
- A Second Color to choose for the Gradient Text Effect. Default: RGB(0, 255, 0)

[h3] Console Commands [/h3]
<> denotes command usage choice. input is only for setters or when prompted.
[u] each[/u] command starts with "simpletimerplus_" (i.e. simpletimerplus_getfont)

[b] Base Timer Entity Options [/b]
- <get/set>name - gets or changes the name of the timer (input: text)
- <get/set>color - gets or changes the color of the timer texts (input: number, number, number)
- <get/set>time - gets or changes the time of the timer in seconds (input: number)
- nohud - toggles the timer HUD to be disabled (default: false)
- nosound - toggles the timer sound to be disabled (default: false)
- notext - toggles chat messages regarding the timer when it's state changes (default: true)
- <get/set>startevent - gets or changes the start event on the timer (input: number, corresponding to value)
- <get/set>stopevent - gets or changes the stop event on the timer (input: number, corresponding to value)
- <get/set>endevent - gets or changes the end event on the timer (input: number, corresponding to value)
- <get/set>mission - gets or changes the mission on the timer (input: number, corresponding to value)
- <get/set>missionevent - gets or changes the mission event on the timer (input: number, corresponding to value)
- <get/set>aftermission - gets or changes the after-mission event for the timer (input: number, corresponding to value)
- <get/set>aftertimer - gets or changes the aftermath of the timer (input: number, corresponding to value)

[b] Plus Timer Entity Options [/b]
- getinfo - gets all of the info set of the timer entity.
- <get/set>secondcolor - gets or changes the secondary color of the timer texts for use with the gradient text effect (input: number, number, number)
- <get/set>currenttime - gets or changes the current running time of the timer in seconds (input: number)
- <get/set>posx/posy - gets or changes the position offset of the timer name on the x-axis or y-axis (input: number)
- <get/set>timeposx/timeposy - gets or changes the position offset of the timer time on the x-axis or y-axis (input: number)
- posxysync - toggles position sync of the timer name and timer time (default: true)
- <get/set>tbcornerradius - gets or changes the textbox corner radius (input: number)
- <get/set>tbposx/tbposy - gets or changes the textbox position offset on the x-axis or y-axis (input: number)
- <get/set>tbwidth/tbheight - gets or changes the textbox width or height (input: number)
- <get/set>tbcolor - gets or changes the textbox color (input: number, number, number)
- <get/set>tbcoloralpha - gets or changes the textbox color alpha (input: number)
- <get/set>state - gets or changes the state of the timer (input: number, corresponding to value)
- <get/set>font - gets or changes the font used for the texts (input: text)
- hidetimer - toggles the timer time text display (timer title remains unaffected) (default: false)
- <get/set>startsound - gets or changes the start sound of the timer (input: number, corresponding to value)
- <get/set>stopsound - gets or changes the stop sound of the timer (input: number, corresponding to value)
- <get/set>endsound - gets or changes the end sound of the timer (input: number, corresponding to value)
- <get/set>fadeintime - gets or changes the HUD fade-in time (input: number with decimals)
- <get/set>fadeouttime - gets or changes the HUD fade-out time (input: number with decimals)
- justifytext - toggles font alignment on some fonts to prevent timer text from jittering (default: false)
- hideentity - toggles the timer entity display in the world (default: false)
- setpreset - changes the timer values based on a given preset (input: text, corresponding to value) [Admin Only]

Please let me know if I forgot any console commands to list here.

[b] Want to try to recreate the Pill Pack Hide and Seek formula on the timer? [/b]
Set the timer name to "Hide and Seek", the timer color to "1.000 0.000 0.000", the timer second color to "1.000, 0.220, 0.220", the time to 600 seconds (or 630 seconds), the textbox corner radius to 0, the Custom Font to "Misery", the Fade In Time to 1.00, the Realign Timer toggle to "Checked/Enabled", the Start Sound to "PPHNS Round Start", the Stop Sound to "FNAF 3 Night Start" (optional but preferred), the End Sound to "PPHNS Round End (Any type)", the Gradient Text Effect to "Left to Right", the gradient speed to 1, the gradient frequency to 2, and that's it.

Alternatively, you can use the simpletimerplus_setpreset console command to change the timer text appearance to match the Pill Pack Hide and Seek timer display. In that case, simpletimerplus_setpreset "PPHNS Start".

[h1] Credits [/h1]
LemonCola3424 - Creator of Simple Timer
Setnour6 - Adjustments, Mod Publisher
malcolm - Code Contributor
DarkStar - Sound & Font Contributor
Next_Rent - Sound Contributor

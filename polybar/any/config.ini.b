;; _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
;;
;;	    ____        __      __              
;;	   / __ \____  / /_  __/ /_  ____ ______
;;	  / /_/ / __ \/ / / / / __ \/ __ `/ ___/
;;	 / ____/ /_/ / / /_/ / /_/ / /_/ / /    
;;	/_/    \____/_/\__, /_.___/\__,_/_/     
;;	              /____/                    
;;
;; Created By Aditya Shakya @adi1090x
;;
;; _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

;; Global WM Settings

;[global/wm]
;margin-bottom = 0
;margin-top = 0

[colors]
background = #282A2E
background-alt = #373B41
foreground = #C5C8C6
primary = #F0C674
secondary = #8ABEB7
alert = #A54242
disabled = #707880

[bar/mybar]
;monitor =
;monitor-strict = false
;override-redirect = false

bottom = false
fixed-center = true

width = 100%
height = 24
offset-x = 0
offset-y = 0

background = ${colors.BACKGROUND}
foreground = ${colors.FOREGROUND}

radius-top = 0.0
radius-bottom = 0.0

;line-size = 2
;line-color = ${color.BLUE}

;border-size = 4
;border-color = ${color.BACKGROUND}

padding = 1
module-margin-left = 1
module-margin-right = 1

font-0 = Iosevka Nerd Font:size=12;3
font-1 = Iosevka Nerd Font:size=12;3

modules-left = mod bspwm 
modules-center = 
modules-right = volume cpu memory filesystem backlight battery network  date

separator =
spacing = 0

dim-value = 1.0

wm-name = bspwm
locale = 

tray-position = right
tray-detached = false
tray-maxsize = 16
tray-transparent = false
tray-background = ${color.BACKGROUND}
tray-offset-x = 0
tray-offset-y = 0
tray-padding = 0
tray-scale = 1.0

wm-restack = bspwm

enable-ipc = true

; bspwm
scroll-up = bspc desktop -f prev.local
scroll-down = bspc desktop -f next.local

[settings]
throttle-output = 5
throttle-output-for = 10
throttle-input-for = 30

screenchange-reload = false

compositing-background = source
compositing-foreground = over
compositing-overline = over
compositing-underline = over
compositing-border = over

;; _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
;;
;;	    __  ___          __      __         
;;	   /  |/  /___  ____/ /_  __/ /__  _____
;;	  / /|_/ / __ \/ __  / / / / / _ \/ ___/
;;	 / /  / / /_/ / /_/ / /_/ / /  __(__  ) 
;;	/_/  /_/\____/\__,_/\__,_/_/\___/____/  
;;
;; Created By Aditya Shakya @adi1090x
;;
;; _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

[module/filesystem]
type = internal/fs

; Mountpoints to display
mount-0 = /

; Seconds to sleep between updates
; Default: 30
interval = 10

; Display fixed precision values
; Default: false
fixed-values = true

; Spacing between entries
; Default: 2
spacing = 4

; Available tags:
;   <label-mounted> (default)
;   <bar-free>
;   <bar-used>
;   <ramp-capacity>
format-mounted = <label-mounted>

; Available tags:
;   <label-unmounted> (default)
format-unmounted = <label-unmounted>

; Available tokens:
;   %mountpoint%
;   %type%
;   %fsname%
;   %percentage_free%
;   %percentage_used%
;   %total%
;   %free%
;   %used%
; Default: %mountpoint% %percentage_free%%
label-mounted = %mountpoint%: %percentage_free%% of %total%

; Available tokens:
;   %mountpoint%
; Default: %mountpoint% is not mounted
label-unmounted = %mountpoint%: not mounted
label-unmounted-foreground = #55


[module/memory]
type = internal/memory

; Seconds to sleep between updates
; Default: 1
interval = 3

; Available tags:
;   <label> (default)
;   <bar-used>
;   <bar-free>
;   <ramp-used>
;   <ramp-free>
;   <bar-swap-used>
;   <bar-swap-free>
;   <ramp-swap-used>
;   <ramp-swap-free>
format = <label> <bar-used>

; Available tokens:
;   %percentage_used% (default)
;   %percentage_free%
;   %gb_used%
;   %gb_free%
;   %gb_total%
;   %mb_used%
;   %mb_free%
;   %mb_total%
;   %percentage_swap_used%
;   %percentage_swap_free%
;   %mb_swap_total%
;   %mb_swap_free%
;   %mb_swap_used%
;   %gb_swap_total%
;   %gb_swap_free%
;   %gb_swap_used%

label = RAM %gb_used%/%gb_free%

; Only applies if <bar-used> is used
bar-used-indicator =
bar-used-width = 50
bar-used-foreground-0 = #55aa55
bar-used-foreground-1 = #557755
bar-used-foreground-2 = #f5a70a
bar-used-foreground-3 = #ff5555
bar-used-fill = ▐
bar-used-empty = ▐
bar-used-empty-foreground = #444444

; Only applies if <ramp-used> is used
ramp-used-0 = ▁
ramp-used-1 = ▂
ramp-used-2 = ▃
ramp-used-3 = ▄
ramp-used-4 = ▅
ramp-used-5 = ▆
ramp-used-6 = ▇
ramp-used-7 = █

; Only applies if <ramp-free> is used
ramp-free-0 = ▁
ramp-free-1 = ▂
ramp-free-2 = ▃
ramp-free-3 = ▄
ramp-free-4 = ▅
ramp-free-5 = ▆
ramp-free-6 = ▇
ramp-free-7 = █



[module/volume]
type = internal/pulseaudio

; Sink to be used, if it exists (find using `pacmd list-sinks`, name field)
; If not, uses default sink
sink = alsa_output.pci-0000_12_00.3.analog-stereo

; Use PA_VOLUME_UI_MAX (~153%) if true, or PA_VOLUME_NORM (100%) if false
; Default: true
use-ui-max = false

; Interval for volume increase/decrease (in percent points)
; Default: 5
interval = 5

format-volume = <ramp-volume> <label-volume>

format-muted = <label-muted>
format-muted-prefix = 婢
format-muted-prefix-font = 2
format-muted-prefix-foreground = ${color.RED}

label-volume = %percentage%%
label-muted = " Muted"
label-muted-foreground = #757575

ramp-volume-0 = 奄
ramp-volume-1 = 奄
ramp-volume-2 = 奄
ramp-volume-3 = 奔
ramp-volume-4 = 奔
ramp-volume-5 = 奔
ramp-volume-6 = 墳
ramp-volume-7 = 墳
ramp-volume-8 = 墳
ramp-volume-9 = 墳
ramp-volume-font = 2
ramp-volume-foreground = ${color.BLUE}

ramp-headphones-0 = 
ramp-headphones-1 = 

;; _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

[module/backlight]
type = internal/xbacklight

card = intel_backlight

format = <ramp> <label>

label = %percentage%%

ramp-0 = 
ramp-1 = 
ramp-2 = 
ramp-3 = 
ramp-4 = 
ramp-5 = 
ramp-6 = 
ramp-7 = 
ramp-8 = 
ramp-9 = 
ramp-font = 2
ramp-foreground = ${color.MAGENTA}

;; _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

[module/battery]
type = internal/battery

full-at = 99

battery = BAT1
adapter = ACAD

poll-interval = 2
time-format = %H:%M

format-charging = <animation-charging> <label-charging>
format-charging-prefix = 

format-discharging = <ramp-capacity> <label-discharging>

format-full = <label-full>
format-full-prefix = " "
format-full-prefix-font = 2
format-full-prefix-foreground = ${color.RED}

label-charging = %percentage%%
label-discharging = %percentage%%
label-full = %percentage%%

ramp-capacity-0 = 
ramp-capacity-1 = 
ramp-capacity-2 = 
ramp-capacity-3 = 
ramp-capacity-4 = 
ramp-capacity-font = 2
ramp-capacity-foreground = ${color.YELLOW}

animation-charging-0 = 
animation-charging-1 = 
animation-charging-2 = 
animation-charging-3 = 
animation-charging-4 = 
animation-charging-font = 2
animation-charging-foreground = ${color.GREEN}
animation-charging-framerate = 750

;; _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

[module/bspwm]
type = internal/bspwm

pin-workspaces = true
inline-mode = false

enable-click = true
enable-scroll = true
reverse-scroll = true

fuzzy-match = true

; ws-icon-[0-9]+ = label;icon
; Note that the label needs to correspond with the bspwm workspace name
;;ws-icon-0 = code;♚
;;ws-icon-1 = office;♛
;;ws-icon-2 = graphics;♜
;;ws-icon-3 = mail;♝
;;ws-icon-4 = web;♞
;;ws-icon-default = ♟

format = <label-state>

label-monitor = %name%

; If any values for label-dimmed-N are defined, the workspace/mode
; colors will get overridden with those values if the monitor is out of focus
; To only override workspaces in a specific state, use:
;   label-dimmed-focused
;   label-dimmed-occupied
;   label-dimmed-urgent
;   label-dimmed-empty
;label-dimmed-foreground = ${color.FOREGROUND}
;label-dimmed-underline = ${color.YELLOW}
;label-dimmed-focused-background = ${color.BACKGROUND}

label-focused = %index%
label-focused-foreground = ${color.BACKGROUND}
label-focused-background = ${color.BLUE}
;label-focused-underline = ${color.RED}
label-focused-padding = 1

label-occupied = %index%
label-occupied-foreground = ${color.BACKGROUND}
label-occupied-background = ${color.GREEN}
;label-occupied-underline = ${color.GREEN}
label-occupied-padding = 1

label-urgent = %index%
label-urgent-foreground = ${color.BACKGROUND}
label-urgent-background = ${color.RED}
;label-urgent-underline = ${color.RED}
label-urgent-padding = 1

label-empty = %index%
label-empty-foreground = ${color.FOREGROUND}
label-empty-padding = 1

; Separator in between workspaces
label-separator = " "
label-separator-padding = 0
;label-separator-foreground = ${color.YELLOW}

;; _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

[module/mod]
type = internal/bspwm

format = <label-mode>
format-background = ${color.YELLOW}
format-foreground = ${color.BACKGROUND}
format-padding = 1

label-monocle = "Monocle"
label-tiled = "Tiled"

label-floating = ", Float"
label-pseudotiled = ", Pseudo"
label-fullscreen = ", Full"

label-locked = " Locked"
label-sticky = " Sticky"
label-private = " Private"

;; _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

[module/modicons]
type = internal/bspwm

format = <label-mode>
format-background = ${color.YELLOW}
format-foreground = ${color.BACKGROUND}
format-padding = 1

label-monocle = ""
label-tiled = ""

label-fullscreen = " "
label-floating = " "
label-pseudotiled = " "

label-locked = " "
label-sticky = " "
label-private = " "

;; _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

[module/date]
type = internal/date

interval = 1.0

date = %d-%m-%Y%
time = %H:%M:%S
time-alt = %A, %d %B %Y

format = <label>
format-prefix = " "
format-prefix-font = 2
format-prefix-foreground = ${color.RED}

label = %date% %time%

;; _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

[module/mpd]
type = internal/mpd

;;host = 127.0.0.1
;;port = 6600
;;password = mysecretpassword

interval = 2

format-online = <label-song> <icon-prev> <toggle> <icon-next>
format-online-prefix = " "
format-online-prefix-font = 1
format-online-prefix-foreground = ${color.GREEN}

format-playing = ${self.format-online}
format-paused = <label-song> <toggle>

format-offline = <label-offline>
label-offline = "Offline"

label-song =  "%title% | %artist%"
label-song-maxlen = 40
label-song-ellipsis = true

icon-play = 
icon-play-font = 2
icon-play-foreground = ${color.GREEN}
icon-pause = 
icon-pause-font = 2
icon-pause-foreground = ${color.YELLOW}
icon-stop = 
icon-stop-foreground = ${color.RED}
icon-prev = 玲
icon-prev-font = 2
icon-prev-foreground = ${color.CYAN}
icon-next = 怜
icon-next-font = 2
icon-next-foreground = ${color.CYAN}

;; _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

[module/network]
type = internal/network
interface = wlan0

interval = 1.0

;;ping-interval = 3
;;udspeed-minwidth = 5

accumulate-stats = true
unknown-as-up = true

format-connected = <ramp-signal> <label-connected>

format-disconnected = <label-disconnected>
format-disconnected-prefix = "睊 "
format-disconnected-prefix-font = 2
format-disconnected-prefix-foreground = ${color.RED}

label-connected = " %ifname% %local_ip%"
label-disconnected = " Disconnected"

ramp-signal-0 = 直
ramp-signal-1 = 直
ramp-signal-2 = 直
ramp-signal-3 = 直
ramp-signal-4 = 直
ramp-signal-font = 2
ramp-signal-foreground = ${color.CYAN}

[module/cpu]
type = internal/cpu

; Seconds to sleep between updates
; Default: 1
interval = 0.5

format-prefix = " "

; Available tags:
;   <label> (default)
;   <bar-load>
;   <ramp-load>
;   <ramp-coreload>
format = <label> <ramp-coreload>

; Available tokens:
;   %percentage% (default) - total cpu load averaged over all cores
;   %percentage-sum% - Cumulative load on all cores
;   %percentage-cores% - load percentage for each core
;   %percentage-core[1-9]% - load percentage for specific core
label = CPU %percentage%%

; Spacing between individual per-core ramps
ramp-coreload-spacing = 1
ramp-coreload-0 = ▁
ramp-coreload-1 = ▂
ramp-coreload-2 = ▃
ramp-coreload-3 = ▄
ramp-coreload-4 = ▅
ramp-coreload-5 = ▆
ramp-coreload-6 = ▇
ramp-coreload-7 = █


;; _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
;;	    __________  ______
;;	   / ____/ __ \/ ____/
;;	  / __/ / / / / /_    
;;	 / /___/ /_/ / __/    
;;	/_____/\____/_/       
;;
;; _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

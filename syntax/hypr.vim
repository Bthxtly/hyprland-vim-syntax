" Vim syntax file
" Language: Hyprland config file
" Maintainer: Gabriel Carneiro
" Latest Revision: 26 October 2022

if exists("b:current_syntax")
  finish
endif

" Strings
syn match	Path "\(\.\|\~\)\/.*"
syn match	Symbol " = " skipwhite contained nextgroup=Value
syn match	Str "[a-z]\+$" contained
syn match	Num "\d\+\(\.\d\+\)\?" contained
syn match	Num "[+-]\d\+\(\.\d\+\)\?" contained
syn match	ShellVar "\$\w\+" contained
syn keyword	Logical on off true false no yes contained
syn cluster Value contains=Str,Num,Logical,ShellVar,Path,Windowrules
"syn region  HyprSimpleString keepend start='[^ \t]' end='$\|#' contained contains=HyprVar,HyprComment
"syn match   HyprQuotedString '"[^"]\+"' contained
"syn cluster HyprString contains=HyprSimpleString,HyprQuotedString

syn region OptBlock start="{" end="}" fold transparent contains=Option,Block,HyprComment,
syn keyword Block input general animations decoration gestures misc dwindle master

syn region Option start='\t\w\+' end="$" transparent contained contains=HyprVar,HyprComment,Symbol,Num,Str,ShellVar,Logical
syn match HyprVar '[a-z _ .]\+ ' skipwhite contained nextgroup=Symbol

" Key modifiers
"syn region Bind start='^bind' end='$\|#' transparent contains=HyprKeyModifier,HyprConfigCommand,Dispatchers,KeyBind,HyprComment
"syn keyword Dispatchers exec pass killactive closewindow workspace movetoworkspace movetoworkspacesilent togglefloating fullscreen dpms pseudo pin movefocus movewindow resizeactive moveactive resizewindowpixel movewindowpixel cyclenext swapnext focuswindow focusmonitor splitratio toggleopaque movecursortocorner workspaceopt exit forcerendererreload movecurrentworkspacetomonitor moveworkspacetomonitor swapactiveworkspaces bringactivetotop togglespecialworkspace layoutmsg resizewindow
"syn keyword HyprKeyModifier SUPER SHIFT CTRL ALT Mod1 Mod2 Mod3 Mod4 Mod5 Mode_switch


syn region Rule keepend start='^windowrule' end='$' transparent contains=Windowrules,Str,Num,Symbol,Value
syn match Windowrules '.*' skipwhite contained nextgroup=Value
"syn keyword Windowrules float tile fullscreen move noblur nofocus noborder noshadow forceinput windowdance pin noanim rounding size nextgroup=Value

" Config commands
"syn match HyprConfigCommand '^\w\+' nextgroup=Symbol
"syn match HyprConfigCommand '[a-z _ .]\+ ' skipwhite nextgroup=Symbol
syn keyword HyprConfigCommand bind bindm monitor source windowrule nextgroup=Symbol


" Comments
syn keyword HyprTodo contained TODO FIXME XXX NOTE
syn match   HyprComment "\(#\|\/\/\).*$" contains=HyprTodo

highlight link Dispatchers		        Special
highlight link Windowrules		        Special

highlight link Num						Constant
highlight link NumRule					Constant

highlight link HyprVar                  Identifier
highlight link HyprConfigCommand        Identifier

highlight link HyprKeyModifier          Constant
highlight link KeyBind					Constant
highlight link Logical					Constant

highlight link Str						String
highlight link BindCmd					String
highlight link Path						String
highlight link HyprSimpleString         String
highlight link HyprQuotedString         String

highlight link Block					Define

highlight link ShellVar			        Define

highlight link HyprTodo                 Todo
highlight link HyprComment              Comment
"syn keyword  HyprVar sensitivity border_size no_border_on_floating gaps_in gaps_out col inactive_border active_border cursor_inactive_timeout damage_tracking layout no_cursor_warps apply_sens_to_raw rounding multisample_edges active_opacity inactive_opacity fullscreen_opacity blur blur_size blur_passes blur_ignore_opacity blur_new_optimizations drop_shadow shadow_range shadow_render_power shadow_ignore_window shadow shadow_inactive shadow_offset dim_inactive dim_strength enabled animation kb_layout kb_variant kb_model kb_options kb_rules kb_file follow_mouse float_switch_override_focus repeat_rate repeat_delay natural_scroll numlock_by_default force_no_accel left_handed accel_profile scroll_method disable_while_typing natural_scroll clickfinger_behavior middle_button_emulation tap-to-click drag_lock scroll_factor transform output workspace_swipe workspace_swipe_fingers workspace_swipe_distance workspace_swipe_invert workspace_swipe_min_speed_to_force workspace_swipe_cancel_ratio workspace_swipe_create_new disable_hyprland_logo disable_splash_rendering no_vfr damage_entire_on_snapshot mouse_move_enables_dpms always_follow_on_dnd layers_hog_keyboard_focus animate_manual_resizes disable_autoreload enable_swallow swallow_regex focus_on_activate pass_mouse_when_bound scroll_event_delay workspace_back_and_forth allow_workspace_cycles overlay damage_blink disable_logs disable_time touchpad pseudotile new_is_master new_on_top
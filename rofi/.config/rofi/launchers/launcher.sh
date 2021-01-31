#!/bin/sh

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

# Available Styles
#
# >> Edit these files and uncomment the desired colors/style.
#
# style_icons_blur		style_icons_full
# style_icons_rainbow		style_icons_rainbow_sidebar
# style_icons_popup		style_normal
# style_normal_grid		style_normal_grid_full
# style_normal_grid_full_round	style_normal_grid_round
# style_normal_purple		style_normal_purple_alt
# style_normal_rainbow		style_normal_rainbow_sidebar

# >> Styles Below Only Works With "rofi-git(AUR)", Current Version: 1.5.4-76-gca067234
#
# ribbon_top		ribbon_top_single
# ribbon_top_round	ribbon_top_single_round
# ribbon_left		ribbon_left_single
# ribbon_left_round	ribbon_left_single_round
# ribbon_bottom		ribbon_bottom_single
# ribbon_bottom_round	ribbon_bottom_single_round
# ribbon_right		ribbon_right_round
# full_bottom		full_top
# full_left		full_right

style="ribbon_bottom_single"

rofi -no-lazy-grab -show drun -theme launchers/"$style".rasi

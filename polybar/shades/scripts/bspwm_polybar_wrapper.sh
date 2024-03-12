#!/bin/bash

# This script simply calls the original bspwm module and then replaces the placeholders with the correct icons.

OUTPUT=$(polybar-msg cmd module.$1.$2)

# Define the icons
declare -A icons
icons=( ["0"]="󰲡" ["1"]="󰲣" ["2"]="󰲥" ["3"]="󰲟" ["4"]="󰲧" ["5"]="icns5" ["6"]="icns6" ["7"]="icns7" ["8"]="icns8" ["9"]="icns9" ["default"]="icnsdefault" )

declare -A icons_occupied
icons_occupied=( ["0"]="icnso0" ["1"]="icnso1" ["2"]="icnso2" ["3"]="icnso3" ["4"]="icnso4" ["5"]="icnso5" ["6"]="icnso6" ["7"]="icnso7" ["8"]="icnso8" ["9"]="icnso9" ["default"]="icnsodefault" )


# Replace placeholders
for index in "${!icons[@]}"; do
    OUTPUT=$(echo "$OUTPUT" | sed "s/%icon-$index%/${icons[$index]}/g")
    OUTPUT=$(echo "$OUTPUT" | sed "s/%icon-occupied-$index%/${icons_occupied[$index]}/g")
done

echo "$OUTPUT"

#ICONOSTAS
icon-5 =   VI;󰲩
icon-6 =  VII;󰲫
icon-7 = VIII;󰲭
icon-8 =   IX;󰲯
icon-9 =    X;󰲱
icon-default = 

icon-occupied-0 =    I;󰲠
icon-occupied-1 =   II;󰲢
icon-occupied-2 =  III;󰲤
icon-occupied-3 =   IV;󰲦
icon-occupied-4 =    V;󰲨
icon-occupied-5 =   VI;󰲪
icon-occupied-6 =  VII;󰲬
icon-occupied-7 = VIII;󰲮
icon-occupied-8 =   IX;󰲰
icon-occupied-9 =    X;󰲞
icon-occupied-default = 


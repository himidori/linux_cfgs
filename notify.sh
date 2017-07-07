#!/bin/sh
# A simple Todo List using notify-send

image=/home/yuimaestro/mirena.png

notify-send -i $image -u critical "
<span foreground='#889CB6'>tasks to-do</span>
<span foreground='#cc241d'>===============================</span>
<span foreground='#A7C4C5'>
<span foreground='#DC7878'>1. </span>suzuka grad eng->rus <span foreground='#D6D6D6'>8.07.17</span>
<span foreground='#DC7878'>2. </span>smile doc eng->rus <span foreground='#D6D6D6'>12.07.17</span>
<span foreground='#DC7878'>3. </span>wembley karaoke <span foreground='#D6D6D6'>15.07.17</span>
</span>
"

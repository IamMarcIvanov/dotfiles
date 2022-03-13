#!/bin/sh

file=$1
temp_file=${file%%.*}-001.${file#*.}
untouched_file=${file%%.*}-002.${file#*.}
cp $file $untouched_file
x_start=0
y_start=0
x_end=$(identify $file | awk '{print $3}' | tr 'x' ' ' | awk '{print $1}')
y_end=$(identify $file | awk '{print $3}' | tr 'x' ' ' | awk '{print $2}')
XMIN=0
XMAX=$x_end
YMIN=0
YMAX=$y_end
MOVE=10
vert_side=0  # this means that the left side is chosen
horz_side=0  # this means that the top side is chosen
while : ; do
    read -n 1 k <&1
    case $k in
        "H")
            vert_side=0 ;;
        "L")
            vert_side=1 ;;
        "J")
            horz_side=1 ;;
        "K")
            horz_side=0 ;;
        "h")  # move edge left by 10 pixels
            if (( vert_side == 0 )) ; then  # left edge
                if (( x_start >= XMIN + MOVE )) ; then
                    x_start=$(( x_start - MOVE )) ;
                fi
            else  # right edge
                if (( x_end >= (XMIN + MOVE) && (x_end - MOVE) > x_start )) ; then
                    x_end=$(( x_end - MOVE )) ;
                fi
            fi
            cp $untouched_file $temp_file ;
            # left edge
            convert $temp_file -fill white -stroke red -draw "line $x_start,$y_start $x_start,$y_end" $temp_file ;
            # right edge
            convert $temp_file -fill white -stroke red -draw "line $x_end,$y_start $x_end,$y_end" $temp_file ;
            # top edge
            convert $temp_file -fill white -stroke red -draw "line $x_start,$y_start $x_end,$y_start" $temp_file ;
            # bottom edge
            convert $temp_file -fill white -stroke red -draw "line $x_start,$y_end $x_end,$y_end" $temp_file ;
            cp $temp_file $file ;;
        "j")  # move edge down by 10 pixels
            if (( horz_side == 0 )) ; then  # top edge
                if (( y_start <= (YMAX - MOVE) && (y_start + MOVE) < y_end )) ; then
                    y_start=$(( y_start + MOVE )) ;
                fi
            else  # bottom edge
                if (( y_end <= (YMAX - MOVE) )) ; then
                    y_end=$(( y_end + MOVE )) ;
                fi
            fi
            cp $untouched_file $temp_file ;
            # left edge
            convert $temp_file -fill white -stroke red -draw "line $x_start,$y_start $x_start,$y_end" $temp_file ;
            # right edge
            convert $temp_file -fill white -stroke red -draw "line $x_end,$y_start $x_end,$y_end" $temp_file ;
            # top edge
            convert $temp_file -fill white -stroke red -draw "line $x_start,$y_start $x_end,$y_start" $temp_file ;
            # bottom edge
            convert $temp_file -fill white -stroke red -draw "line $x_start,$y_end $x_end,$y_end" $temp_file ;
            cp $temp_file $file ;;
        "l")  # move edge right by 10 pixels
            if (( vert_side == 0 )) ; then  # left edge
                if (( x_start <= (XMAX - MOVE) && (x_start + MOVE) < x_end )) ; then
                    x_start=$(( x_start + MOVE )) ;
                fi
            else  # right edge
                if (( (x_end + MOVE) <= XMAX )) ; then
                    x_end=$(( x_end + MOVE )) ;
                fi
            fi
            cp $untouched_file $temp_file ;
            # left edge
            convert $temp_file -fill white -stroke red -draw "line $x_start,$y_start $x_start,$y_end" $temp_file ;
            # right edge
            convert $temp_file -fill white -stroke red -draw "line $x_end,$y_start $x_end,$y_end" $temp_file ;
            # top edge
            convert $temp_file -fill white -stroke red -draw "line $x_start,$y_start $x_end,$y_start" $temp_file ;
            # bottom edge
            convert $temp_file -fill white -stroke red -draw "line $x_start,$y_end $x_end,$y_end" $temp_file ;
            cp $temp_file $file ;;
        "k")  # move edge up by 10 pixels
            if (( horz_side == 0 )) ; then  # top edge
                if (( y_start >= (YMIN + MOVE) )) ; then
                    y_start=$(( y_start - MOVE )) ;
                fi
            else  # bottom edge
                if (( y_end >= (YMIN + MOVE) && (y_end - MOVE) > y_start )) ; then
                    y_end=$(( y_end - MOVE )) ;
                fi
            fi
            cp $untouched_file $temp_file ;
            # left edge
            convert $temp_file -fill white -stroke red -draw "line $x_start,$y_start $x_start,$y_end" $temp_file ;
            # right edge
            convert $temp_file -fill white -stroke red -draw "line $x_end,$y_start $x_end,$y_end" $temp_file ;
            # top edge
            convert $temp_file -fill white -stroke red -draw "line $x_start,$y_start $x_end,$y_start" $temp_file ;
            # bottom edge
            convert $temp_file -fill white -stroke red -draw "line $x_start,$y_end $x_end,$y_end" $temp_file ;
            cp $temp_file $file ;;
        "q")
            convert $untouched_file -crop +$x_start+$y_start -crop -$(( XMAX - x_end ))-$(( YMAX - y_end )) $file ;
            break ;;
    esac
done
rm $untouched_file $temp_file

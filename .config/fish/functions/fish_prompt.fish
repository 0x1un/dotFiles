set -g CMD_DURATION 0

function lolfish -d "such rainbow. wow"

    # xterm-256color RGB color values
    # valid R G B hex values : 00, 57, 87, af, d7, ff
    #
    # red    ff0000
    # yellow ffff00
    # green  00ff00
    # blue   0000ff

    set -l colors ff0000 ff5700 ff8700 ffaf00 ffd700\
                  ffff00 d7ff00 afff00 87ff00 57ff00\
                  00ff00 00ff57 00ff87 00ffaf 00ffd7\
                  00ffff 00d7ff 00afff 0087ff 0057ff\
                  0000ff 5700ff 8700ff af00ff d700ff\
                  ff00ff ff00d7 ff00af ff0087 ff0057

    #
    # $colors[n]: color
    # n=1  : red
    # n=6  : yellow
    # n=16 : green
    # n=21 : blue
    # n=26 : magenta
    #
    if test -z $lolfish_next_color; or \
       test $lolfish_next_color -gt (count $colors); or \
       test $lolfish_next_color -le 0
         # set to red
         set -g lolfish_next_color 1
    end

    # Set the color differential between prompt items.
    # Lower values produce a smoother rainbow effect.
    # Values between 1 and 5 work best.
    # 10 produces a pure RGB rainbow.
    # 5 works best for non 256 color terminals.

    set -l color_step 1

    # start the printing process
    for arg in $argv

        # print these special characters in normal color
        switch $arg
            case ' ' \( \) \[ \] \: \@ \{ \} \/
                set_color normal
                echo -n -s $arg
                continue
        end

        # saftey checks
        # set $color if it's not set yet
        if test -z $color
            set color $lolfish_next_color
        # Reset color to the beginning when it grows
        # beyond the valid color range.
        else if test $color -gt (count $colors); or test $color -le 0
            set color 1
        end

        set_color $colors[$color]
        echo -n -s $arg
        set color (math $color + $color_step)
    end

    # increment lolfish_next_color to use for the start of the next line
    set lolfish_next_color (math $lolfish_next_color + $color_step)

    set_color normal
end

function bc; command bc -l $argv; end


function fish_prompt
  set -l code $status

  set -l prompt (prompt_pwd)
  set -l base (basename "$prompt")
  set -l env (lolfish "[🐍" (basename $VIRTUAL_ENV)"]")
  if set -q VIRTUAL_ENV
      # echo "🐍" (basename "$VIRTUAL_ENV")
      echo $env
  end



 lolfish (begin

    if test "$PWD" = "/"
      test $code -eq 0; and echo "/"; or echo "/"
    else
      echo ""
    end
  end)(echo "$prompt" \
  | sed "s|~|"(begin
      test $code -eq 0; and echo ; or echo 
    end)"⌁""|g" \
  | sed "s|/|"" ) ""|g" \
  | sed "s|"$base"|"$base" |g")(begin
      if test "$PWD" = "/"
        echo ""
      else
        echo "> "
      end
    end)
end

# (begin
    # test "$PWD" = "$HOME"; and echo " "; echo ""
    # end)

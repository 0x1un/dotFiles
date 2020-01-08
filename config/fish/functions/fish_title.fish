function fish_title
  echo "⌁ " (uname -n)" ⌁ "(whoami)" @ "(basename $PWD)(begin
      test -n "$HOSTNAME"; and echo " ⌁ $HOSTNAME"; or echo ""
    end)
end

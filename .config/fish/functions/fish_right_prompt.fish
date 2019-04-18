function flash_git_is_stashed
  command git rev-parse --verify --quiet refs/stash >/dev/null
end

function flash_git_branch_name
  command git symbolic-ref --short HEAD
end

function flash_git_is_touched
  test -n (echo (command git status --porcelain))
end

function fish_right_prompt
  set -l code $status

  function status::color -S
    test $code -ne 0; and echo ; or echo 
  end

  if test $CMD_DURATION -gt 1000
    lolfish " ~"(printf "%.1fs " (math "$CMD_DURATION / 1000"))
  end

  if test -d .git
    if flash_git_is_stashed
      echo "<"
    end
    printf (begin
      flash_git_is_touched
        and echo "(*"(flash_git_branch_name)")"
        or echo "("(flash_git_branch_name)")"
    end)
  end

  printf " "(date +%H(status::color):%M(status::color):%S)" "

  if test $code -ne 0
    echo "≡ ""$code"
  end
end

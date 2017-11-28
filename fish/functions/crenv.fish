function crenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell update
    . (crenv "sh-$command" $argv|psub)
  case '*'
    command crenv "$command" $argv
  end
end

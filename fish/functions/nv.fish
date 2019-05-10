function nv
    nextver get $argv[1] \
        --github-token=(pass show GitHub/NextverToken) \
        --github-owner=(echo $argv[2] | cut -d "/" -f1) \
        --github-repo=(echo $argv[2] | cut -d "/" -f2) \
        $argv[3]
end

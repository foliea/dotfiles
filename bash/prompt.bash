# Color codes
YELLOW='\[\e[0;33m\]'
BLUE='\[\e[0;34m\]'
MAGENTA='\[\e[1;35m\]'
RED='\[\e[0;31m\]'
GREEN='\[\e[1;32m\]'
WHITE='\[\e[1;37m\]'
RESET='\[\e[0m\]'

# Git status function (simplified for Bash)
bash_git_prompt() {
    git rev-parse --is-inside-work-tree &>/dev/null || return

    local branch
    branch=$(git symbolic-ref --quiet --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    [ -z "$branch" ] && return

    local staged conflicts changed untracked stashed clean
    staged=$(git diff --cached --numstat 2>/dev/null | wc -l)
    conflicts=$(git diff --name-only --diff-filter=U 2>/dev/null | wc -l)
    changed=$(git diff --numstat 2>/dev/null | wc -l)
    untracked=$(git ls-files --others --exclude-standard 2>/dev/null | wc -l)
    stashed=$(git stash list 2>/dev/null | wc -l)
    clean=0
    if [[ $staged -eq 0 && $conflicts -eq 0 && $changed -eq 0 && $untracked -eq 0 ]]; then
        clean=1
    fi

    # Use raw ANSI codes, not Bash variables, for color in the status string
    local status
    status="[\033[1;35m${branch}\033[0m"

    [[ $staged -ne 0 ]]    && status+="|\033[0;31m● $staged\033[0m"
    [[ $conflicts -ne 0 ]] && status+="|\033[0;31m✖ $conflicts\033[0m"
    [[ $changed -ne 0 ]]   && status+="|\033[0;34m✚ $changed\033[0m"
    [[ $untracked -ne 0 ]] && status+="|\033[0;33m…$untracked\033[0m"
    [[ $stashed -ne 0 ]]   && status+="|\033[0;33m⚑ $stashed\033[0m"
    [[ $clean -eq 1 ]]     && status+="|\033[1;32m✔\033[0m"

    status+="]"
    echo -ne " $status"
}

# Set PS1 to mimic your Fish prompt (use double quotes for variable expansion)
PS1="${YELLOW}\w${RESET}\$(bash_git_prompt) \n${WHITE}\A${RESET}  \$ "

function share-clipboard
    # Only on darwin
    if type reattach-to-user-namespace > /dev/null 2>&1
        reattach-to-user-namespace -l $SHELL
    end
end

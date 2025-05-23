function unarchive
    set --local files $argv

    for file in $files
        if test -f $file
            set --local extension (echo $file | awk -F. '{print $NF}')
            set --local filename (basename $file .$extension)

            switch $extension
                case zip
                    unzip -d $filename $file
                case tar
                    tar -xf $file -C $filename
                case tgz
                    tar zxvf $file -C $filename
                case rar
                    unrar e $file $filename
                case 7z
                    7z x -o$filename $file
            end
        else
            echo "$file is not a valid file"
        end
    end
end

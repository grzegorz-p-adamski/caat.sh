caat() {
    cat_top=( ".ﾊ,,ﾊ " "( ﾟωﾟ) " "|つ　つ" )
    cat_body="|　　| "
    cat_feet="Ｕ\"Ｕ  "
    
    paws_printed=false
    echo "${cat_top[0]}"
    line_number=0

    if [ -z "$1" ]; then
        # Read from standard input if no filename is provided
        while IFS= read -r line; do
            case $line_number in
                0)
                    echo "${cat_top[1]} - $line"
                    ;;
                1)
                    echo "${cat_top[2]}   $line"
                    paws_printed=true
                    ;;
                *)
                    echo "$cat_body   $line"
                    ;;
            esac
            ((line_number++))
        done
    else
        # Read from the specified file
        while IFS= read -r line; do
            case $line_number in
                0)
                    echo "${cat_top[1]} - $line"
                    ;;
                1)
                    echo "${cat_top[2]}   $line"
                    paws_printed=true
                    ;;
                *)
                    echo "$cat_body   $line"
                    ;;
            esac
            ((line_number++))
        done < "$1"
    fi
    if [ "$paws_printed" = false ]; then
        echo "${cat_top[2]}"
    fi
    echo "$cat_body"
    echo "$cat_feet"
}

# Example usage:
# caat <filename>
# or
# <command> | caat

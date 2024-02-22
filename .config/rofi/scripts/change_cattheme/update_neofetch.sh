neofetch="/home/marq/.config/neofetch/"
current_file_path=$(realpath $0)
theme=$1
if [ "$theme" = "latte" ]; then
    echo "sylveon" > "${neofetch}pokemon.txt"
elif [ "$theme" = "frappé" ]; then
    echo "glaceon -s" > "${neofetch}pokemon.txt"
elif [ "$theme" = "macchiato" ]; then
    echo "espeon" > "${neofetch}pokemon.txt"
else
    echo "umbreon" > "${neofetch}pokemon.txt"
fi

if [ "$#" -eq 1 ]; then
	echo "$1" > .distloc
fi

if [ ! -e ".distloc" ]; then
	echo "No memory of previous dist location"
	echo "call $0 with the location of the dist output"
	exit 1
fi

DIST=$(cat .distloc)

if [ ! -e "$DIST" ]; then
	echo "$DIST does not exist!"
	echo "Make sure it exists, or call $0 with the location of the correct dist output"
	exit 1
fi

echo "Copying distribution.."

rsync -vrthc "$DIST/" . --delete --exclude update.sh --exclude .gitignore --exclude .distloc --exclude .git --exclude index.html --exclude styles.css
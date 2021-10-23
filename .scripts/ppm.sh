ppm() {
  if [ $1 = install ]; then
    pip3 install $2 &&
    pip3 freeze > $(pwd)/requirements.txt &&
    python3 -m pipdeptree > deptree.txt;
  elif [ $1 = uninstall ]; then
    pip3 uninstall $2 &&
    pip3 freeze > $(pwd)/requirements.txt &&
    python3 -m pipdeptree > deptree.txt;
  fi
}

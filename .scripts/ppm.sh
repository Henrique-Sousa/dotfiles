ppm() {
  if [ $1 = install ]; then
    if [ $# -gt 1 ]; then
      pip3 install ${@:2};
    else
      pip3 install -r requirements.txt;
    fi 
    pip3 freeze > $(pwd)/requirements.txt &&
    python3 -m pipdeptree > deptree.txt;
  elif [ $1 = uninstall -a $# -gt 1 ]; then
    pip3 uninstall ${@:2} &&
    pip3 freeze > $(pwd)/requirements.txt &&
    python3 -m pipdeptree > deptree.txt;
  fi
}

#!/usr/bin/fish

function aspell -d "Run aspell spell checking on a file"
  if test -z $argv[1]
    echo 'Usage: aspell [file]'
  else
    set file $argv[1]
    set abs (echo $file | awk '{print substr($1, 0, length(1))}')
    set mnt /usr/src/app

    if test $abs = '/'
      echo 'Only relative files are allowed!'
      echo 'Usage: aspell [file]'
      return 1
    end

    docker run --rm -it \
      -v $HOME/.aspell:/etc/aspell \
      -v (pwd):$mnt\
      starefossen/aspell \
        aspell check \
          --dont-backup \
          --encoding=utf-8 \
          --home-dir /etc/aspell \
          $mnt/$file
  end
end

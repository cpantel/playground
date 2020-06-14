#!/usr/bin/awk -f

function load_whitelist(file, whitelist) {
   while (1) {
      status = getline record < file
      if (status == -1) {
         print "Failed to read file " file
         exit 1
      }
      if (status == 0) break
      whitelist[++count] = record
   }
   close(file)
}

function check_in_whitelist(path, whitelist) {
  for ( elem in whitelist ) {
    if ( index(path, whitelist[elem]) == 35 ) {
      return 1
    }
  }
  return 0
}

function print_checked(line, whitelist) {
  if ( check_in_whitelist(line, whitelist) ) {
    print "XXX " line
  } else {
    print "    " line
  }
}

BEGIN {
  state = "state_first"
  load_whitelist("whitelist.txt", whitelist)
}

/.*/ {
  switch (state) {
    case "state_first":
       linea_anterior = $0
       md5_anterior   = $1
       state = "state_head"
    break
    case "state_head":
      if ($1 == md5_anterior) {
        print_checked(linea_anterior, whitelist)
        linea_anterior = $0
        state = "state_tail"
      } else {
       linea_anterior = $0
       md5_anterior   = $1
      }
    break
    case "state_tail":
      if ($1 == md5_anterior) {
        print_checked(linea_anterior, whitelist)
        linea_anterior = $0
      } else {
        print_checked(linea_anterior, whitelist)
        print "======================================"
        linea_anterior = $0
        md5_anterior   = $1
        state = "state_head"
      }
    break
  }

}

END {
  if (state == "state_tail" ) {
    print_checked(linea_anterior, whitelist)

 }
}



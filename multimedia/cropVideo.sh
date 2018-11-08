#                                                               input file output file    start            stop                 w:h:x:y       
mencoder -oac copy -ovc xvid -xvidencopts pass=2:bitrate=12000  planB.ogv -o crop.ogv -ss 00:00:00 -endpos 00:00:25 -vf crop=2000:700:0:0

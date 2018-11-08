# mirroring http://www.proyecto-ciaa.com.ar/devwiki/doku.php?id=repo:configuracion:java

update-alternatives --list java

# update-alternatives --install EXECUTABLE NAME EXECUTABLE_REAL_PATH PRIORITY

sudo update-alternatives --install /usr/bin/java java /opt/java/jdk1.8.0_102/jre/bin/java 3
sudo update-alternatives --install /usr/bin/javac javac /opt/java/jdk1.8.0_102/bin/javac 3

sudo update-alternatives --config java

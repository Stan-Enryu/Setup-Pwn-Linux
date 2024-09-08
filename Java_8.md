---- install java 8
https://www.openlogic.com/openjdk-downloads?field_java_parent_version_target_id=416&field_operating_system_target_id=426&field_architecture_target_id=391&field_java_package_target_id=All

sudo update-alternatives --config java
update-alternatives --list java

wget https://edelivery.oracle.com/akam/otn/java/jdk/8u202-b08/1961070e4c9b4e26a04e7f5a083f551e/jdk-8u202-linux-x64.tar.gz

sudo tar -xzf ./openlogic-openjdk-8u422-b05-linux-x64.tar.gz -C /usr/lib/jvm/open-jdk-8 --strip-components=1

sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/open-jdk-8/bin/java 1
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/open-jdk-8/bin/javac 1
sudo update-alternatives --install /usr/bin/jar jar /usr/lib/jvm/open-jdk-8/bin/jar 1
sudo update-alternatives --install /usr/bin/jshell jshell /usr/lib/jvm/open-jdk-8/bin/jshell 1
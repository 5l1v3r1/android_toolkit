FROM ubuntu:18.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y wget xauth libxtst6 libxi6 git qt5-default qt4-linguist-tools qt5-qmake qttools5-dev build-essential android-tools-adb zipalign unzip libc++1 mesa-utils libgl1-mesa-glx libpulse0 && \
    mkdir -p /root/bin && echo export PATH=\$PATH:/root/bin && \
    mkdir -p /opt && cd /opt && \
    wget -O intellij.tar.gz "https://data.services.jetbrains.com/products/download?code=IIU&platform=linux" && \
    tar xf intellij.tar.gz && \
    find /opt -maxdepth 1 -type d -iname "idea*" -exec echo export PATH=\$PATH:{}/bin:{}/jre64/bin >> ~/.bashrc \; && \
    cd /opt && wget https://github.com/java-decompiler/jd-gui/releases/download/v1.4.0/jd-gui-1.4.0.jar && \
    echo alias jd-gui=\"java -jar /opt/jd-gui-1.4.0.jar\" >> ~/.bashrc && \
    cd /opt && git clone --depth=1 https://github.com/vaibhavpandeyvpz/apkstudio.git && \
    mkdir -p ~/.apkstudio/vendor/ && cd ~/.apkstudio/vendor/ && wget -O apktool.jar "https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.3.3.jar" && wget -O uber-apk-signer.jar "https://github.com/patrickfav/uber-apk-signer/releases/download/v0.8.4/uber-apk-signer-0.8.4.jar" && echo alias apktool=\'java -jar /root/.apkstudio/vendor/apktool.jar\' >> ~/.bashrc && echo alias uber-apk-signer=\'java -jar /root/.apkstudio/vendor/uber-apk-signer.jar\' >> ~/.bash && \
    cd /opt/apkstudio && lrelease res/lang/en.ts && qmake apkstudio.pro CONFIG+=release && make -j`nproc` && echo export PATH=\$PATH:/opt/apkstudio >> ~/.bashrc && \
    cd /opt && wget "https://github.com/pxb1988/dex2jar/releases/download/2.0/dex-tools-2.0.zip" && unzip dex-tools-2.0.zip && cd /opt/dex2jar-2.0 && chmod +x *.sh && echo export PATH=\$PATH:/opt/dex2jar-2.0 >> ~/.bashrc && \
    echo cat ~/README.md >> ~/.bashrc

COPY --chown=root:root README.md /root/.

WORKDIR /root
RUN ["/bin/bash"]

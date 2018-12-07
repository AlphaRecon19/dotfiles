FROM alpharecon19/desktop

ARG REVISION
ENV ZIP_URL="https://www.googleapis.com/download/storage/v1/b/chromium-browser-snapshots/o/Linux_x64%2F$REVISION%2Fchrome-linux.zip?alt=media"
ENV ZIP_FILE="${REVISION}-chrome-linux.zip"

ENV google_api_key="AIzaSyDwr302FpOSkGRpLlUpPThNTDPbXcIn_FM"
ENV google_default_client_id="413772536636.apps.googleusercontent.com"
ENV google_default_client_secret="0ZChLK6AxeA3Isu96MkwqDR4"

RUN groupadd -r chromium \
    && useradd -r -g chromium chromium \
    && mkdir -p /home/chromium/Downloads \
    && chown -R chromium:chromium /home/chromium \
    && mkdir -p /home/chromium/.config/gtk-3.0/ /home/chromium/.config/chromium/ \
    && echo "[Settings]" > /home/chromium/.config/gtk-3.0/settings.ini \
    && echo "gtk-application-prefer-dark-theme=1" >> /home/chromium/.config/gtk-3.0/settings.ini

WORKDIR /home/chromium

USER chromium

RUN curl -# $ZIP_URL > $ZIP_FILE \
    && unzip $ZIP_FILE \
    && rm -f $ZIP_FILE

ENTRYPOINT ["/home/chromium/chrome-linux/chrome"]

CMD ["--enable-smooth-scrolling", "--force-gpu-rasterization", "--gpu-process", "--remote-debugging-port=9222", "--restore-last-session", "--ssl-version-min=tls1.2", "--enable-zero-copy", "--enable-gpu-rasterization","--enable-native-gpu-memory-buffers"]

#
# Copyright (c) 2020 Yao Wei Tjong. All rights reserved.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#

FROM ubuntu:latest

ARG CONFIGS

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends autoconf automake bison flex g++ gawk help2man libncurses5-dev libtool-bin make patch python3 texinfo unzip wget xz-utils \
    \
    # Download released tarball for crosstool-ng and build it
    && mkdir /crosstool-ng && wget -qO- http://crosstool-ng.org/download/crosstool-ng/crosstool-ng-1.24.0.tar.bz2 |tar --strip-components=1 -xjC /crosstool-ng \
    && cd /crosstool-ng && ./configure && make && make install \
    \
    && useradd -s /bin/bash ng

COPY --chown=ng:ng ng/ /home/ng/

RUN su ng -c 'cd ~/src && for config in $CONFIGS; do echo $config && ct-ng $config && sed -i 's/^CT_LOG_PROGRESS_BAR=y$/CT_LOG_PROGRESS_BAR=n/' .config && ct-ng build; done'

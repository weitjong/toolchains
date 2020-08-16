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

FROM weitjong/x-tool AS toolchain-builder

LABEL maintainer="Yao Wei Tjong <weitjong@gmail.com>" \
      description="Generic cross-compiler toolchains builder" \
      source-repo=https://github.com/weitjong/toolchains \
      binary-repo=https://hub.docker.com/u/weitjong

ARG CONFIG

RUN su ng -c "mkdir ~/src && cd ~/src && ct-ng $CONFIG && sed -i -f /mod/config.sed .config && if [[ -f /mod/$CONFIG.sed ]]; then sed -i -f /mod/$CONFIG.sed .config; fi && export DEB_TARGET_MULTIARCH=$(echo $CONFIG |perl -pe 's/(aarch64|arm).*-.+(-.+)(-.+)/$1$2$3/' -) && ct-ng build" \
    \
 && find /home/ng/x-tools -name build.log |xargs rm

##

FROM scratch

COPY --from=toolchain-builder /home/ng/x-tools/ /toolchain/

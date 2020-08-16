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

s/CT_PATCH_BUNDLED=y/CT_PATCH_BUNDLED=n/
s/# CT_PATCH_BUNDLED_LOCAL is not set/CT_PATCH_BUNDLED_LOCAL=y/
s/CT_PATCH_ORDER="bundled"/CT_PATCH_ORDER="bundled,local"/
/CT_PATCH_ORDER/ a CT_LOCAL_PATCH_DIR="/patch"
/CT_PATCH_ORDER/ a CT_PATCH_USE_LOCAL=y
s/CT_LOG_PROGRESS_BAR=y/CT_LOG_PROGRESS_BAR=n/
s/CT_LOG_FILE_COMPRESS=y/CT_LOG_FILE_COMPRESS=n/
s/CT_ARCH_SUFFIX=".*"/CT_ARCH_SUFFIX=""/
s/# CT_OMIT_TARGET_VENDOR is not set/CT_OMIT_TARGET_VENDOR=y/
s/CT_CC_GCC_EXTRA_CONFIG_ARRAY=""/CT_CC_GCC_EXTRA_CONFIG_ARRAY="--enable-multiarch"/

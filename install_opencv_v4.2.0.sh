############################################### install opencv 4.2.0 ###############################################
# sudo apt install libopencv-dev -y
## refer to https://gist.github.com/raulqf/f42c718a658cddc16f9df07ecc627be7
sudo apt install build-essential cmake pkg-config unzip yasm git checkinstall -y
sudo apt install libjpeg-dev libpng-dev libtiff-dev -y
sudo apt install libavcodec-dev libavformat-dev libswscale-dev libavresample-dev -y
sudo apt install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev -y
sudo apt install libxvidcore-dev x264 libx264-dev libfaac-dev libmp3lame-dev libtheora-dev -y
sudo apt install libfaac-dev libmp3lame-dev libvorbis-dev -y

sudo apt install libopencore-amrnb-dev libopencore-amrwb-dev -y

sudo apt-get install libdc1394-22 libdc1394-22-dev libxine2-dev libv4l-dev v4l-utils -y
cd /usr/include/linux
sudo ln -s -f ../libv4l1-videodev.h videodev.h
cd -

sudo apt-get install python3-dev python3-pip -y
# sudo -H pip3 install -U pip numpy -y
sudo apt install python3-testresources -y

sudo apt-get install libtbb-dev -y

sudo apt-get install libatlas-base-dev gfortran -y

sudo apt-get install libprotobuf-dev protobuf-compiler -y
sudo apt-get install libgoogle-glog-dev libgflags-dev -y
sudo apt-get install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen -y

## install opencv 4.2.0
cd ~
wget -O opencv.zip https://github.com/opencv/opencv/archive/4.2.0.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/4.2.0.zip
unzip opencv.zip
unzip opencv_contrib.zip

echo "Create a virtual environtment for the python binding module"

sudo pip3 install virtualenv virtualenvwrapper
sudo rm -rf ~/.cache/pip3

echo "Edit ~/.bashrc"
export WORKON_HOME=$HOME/.virtualenvs

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source /usr/local/bin/virtualenvwrapper.sh

mkvirtualenv cv -p python3
pip3 install numpy

sudo apt install gcc-6 -y

echo "Procced with the installation"
cd opencv-4.2.0
mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_C_COMPILER=/usr/bin/gcc-6 \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D INSTALL_PYTHON_EXAMPLES=ON \
-D INSTALL_C_EXAMPLES=OFF \
-D WITH_TBB=ON \
-D WITH_CUDA=ON \
-D BUILD_opencv_cudacodec=OFF \
-D ENABLE_FAST_MATH=1 \
-D CUDA_FAST_MATH=1 \
-D WITH_CUBLAS=1 \
-D WITH_V4L=ON \
-D WITH_QT=OFF \
-D WITH_OPENGL=ON \
-D WITH_GSTREAMER=ON \
-D OPENCV_GENERATE_PKGCONFIG=ON \
-D OPENCV_PC_FILE_NAME=opencv.pc \
-D OPENCV_ENABLE_NONFREE=ON \
-D OPENCV_PYTHON3_INSTALL_PATH=~/.virtualenvs/cv/lib/python3.6/site-packages \
-D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-4.2.0/modules \
-D PYTHON_EXECUTABLE=~/.virtualenvs/cv/bin/python \
-D BUILD_EXAMPLES=ON ..

make -j12

############################################### install opencv 4.2.0 ###############################################

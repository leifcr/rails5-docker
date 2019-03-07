!#/bin/sh
cd dev
docker build . -t leifcr/rails5:latest-dev
cd ..
docker build . -t leifcr/rails5:latest
cd ..
echo "-------------"
echo "DONE!"
echo "-------------"

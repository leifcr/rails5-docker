!#/bin/sh
cd dev
docker build . -t leifcr/rails5:latest-dev
cd ..
docker build . -t leifcr/rails5:latest
cd s2i-passenger-standalone
docker build . -t leifcr/rails5-passenger-standalone:latest
cd ..
echo "-------------"
echo "DONE!"
echo "-------------"


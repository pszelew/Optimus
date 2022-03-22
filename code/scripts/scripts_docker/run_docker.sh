SCRIPTPATH="/home/patryk/Studia/PracaMagisterska/optimus"
IMAGE="chunyl/pytorch-transformers:v2"
echo $IMAGE

docker run \
--runtime=nvidia \
-it --rm \
--net host \
--volume ${SCRIPTPATH}:/workspace \
--interactive --tty $IMAGE /bin/bash

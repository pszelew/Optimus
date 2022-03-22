SCRIPTPATH="/home/patryk/Studia/PracaMagisterska/optimus"
IMAGE="pszelew/optimus_env:1.0"
echo $IMAGE

docker run \
--runtime=nvidia \
-it --rm \
--net host \
--volume ${SCRIPTPATH}:/workspace \
--interactive --tty $IMAGE /bin/bash

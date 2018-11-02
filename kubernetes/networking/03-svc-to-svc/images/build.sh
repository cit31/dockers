if [ -z "$1" ]; then 
   echo "Provide the Directory as inpuit"
  exit 1
fi 
DIR=$1
if [ ! -f "$DIR/Dockerfile" ]; then 
  echo "No Docker file "
  exit 1
fi
IMAGE=$(cat $DIR/Dockerfile | head -1 | sed -e 's/^#//')
cd $DIR
docker build -t $IMAGE . && docker push $IMAGE

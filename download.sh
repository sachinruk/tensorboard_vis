apt-get install -y wget
mkdir -p data
if [ ! -e ./data/train-images-idx3-ubyte ]
then
    wget -N http://fashion-mnist.s3-website.eu-central-1.amazonaws.com/train-images-idx3-ubyte.gz -P data/
    wget -N http://fashion-mnist.s3-website.eu-central-1.amazonaws.com/train-labels-idx1-ubyte.gz -P data/
    curr_dir=$(pwd)
    # untar train files
    cd data
    for f in `find . -type f -name "*.gz"`
    do
        gzip -d $f
    done
else
    echo "Files already extracted"
fi
# rm *.gz
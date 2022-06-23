#! bin/bash
echo 'We Suppose you have Anaconda installed at /Home/username/Anaconda3'

echo 'export PATH=~/anaconda3/bin:$PATH' >> ~/.bashrc

echo 'Do you want to :'
echo '1. Install Tensorflow without GPU'
echo '2. Install Tensorflow with GPU'
echo '3. Uninstall env'
read input

if [ $input -eq 2 ]
then
	echo 'Name of the TENSORFLOW ENVIRONMENT:'
	read ENVNAME

	#CREATING THE ENV
	echo 'CREATING THE ENV'
	conda create --name $ENVNAME -y
	echo $ENVNAME CREATED!

	#ACTIVATE THE eNV
	echo 'ACTIVATING ENV'
	conda activate $ENVNAME6
	echo $ENVNAME ACTIVATED!

	# INSTALLING CUDA DRIVERS
	echo 'INSTALLING CUDA DRIVERS'
	conda install -c conda-forge cudatoolkit=11.2 cudnn=8.1.0 -y

	# INSTALLING TENSORFLOW
	echo 'INSTALLING TENSORFLOW-GPU'
	conda install tensorflow-gpu -y
	conda install -c anaconda ipykernel -y
	conda install ipykernel -y

	# ADDING ENV TO JUPYTER LIST
	echo 'ADDING ENV TO JUPYTER LIST'
	python3 -m ipykernel install --user --name=$ENVNAME
	echo 'ADDED ENV TO THE LIST'

	echo 'VERIFY GPU SUPPORT'
	python3 -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"

	echo 'TO CHECK IF GPU IS LISTED IN THE TENSORFLOW, RUN THE CODE'
	
	echo 'import tensorflow as tf
	print(tf.__version__)
	print(len(tf.config.list_physical_devices('GPU')))'

elif [ $input -eq 1 ]
then
	echo 'Name of the TENSORFLOW ENVIRONMENT:'
	read ENVNAME

	#CREATING THE ENV
	echo 'CREATING THE ENV'
	conda create --name $ENVNAME -y
	echo $ENVNAME CREATED!

	#ACTIVATE THE eNV
	echo 'ACTIVATING ENV'
	conda activate $ENVNAME6
	echo $ENVNAME ACTIVATED!

	# INSTALLING TENSORFLOW
	echo 'INSTALLING TENSORFLOW-GPU'
	conda install tensorflow -y
	conda install -c anaconda ipykernel -y
	conda install ipykernel -y

	# ADDING ENV TO JUPYTER LIST
	echo 'ADDING ENV TO JUPYTER LIST'
	python3 -m ipykernel install --user --name=$ENVNAME
	echo 'ADDED ENV TO THE LIST'



elif [ $input -eq 3 ]
	then
	echo 'name of ENV you want to UNINSTALL:'
	read UNENV 
	jupyter kernelspec uninstall $UNENV
	conda env remove -n $UNENV


else
echo ' Wrong move!!!!!! you suck'

fi

exit

clear

echo "Criando Usuario Para o VirtualBox"
adduser vbox

clear 
echo "#######################################################"
echo "#######################################################"
echo "######## Iniciando Instalacao VirtualBox Web ##########"
echo "#######################################################"
echo "#######################################################"
echo "####################### Tiago Oliveira da Fonseca #####"
echo "#### Ubuntu 1404 LTS ##################################"
echo "#######################################################"
sleep 10s


echo "#############################################"
echo "########## Instalando Atualizacoes ##########"
echo "#############################################"
sleep 5s

	apt-get update -y
	apt-get upgrade -y
	
clear 
echo "##########################################################"
echo "################# Instalando Dependencias ################"
echo "##########################################################"
sleep 5s

	apt-get install build-essential dkms unzip -y
	

clear 
echo "##########################################################"
echo "############### Instalando VirtualBox ####################"
echo "##########################################################"
sleep 5s
	
	cd /tmp
	wget http://download.virtualbox.org/virtualbox/4.3.40/virtualbox-4.3_4.3.40-110317~Ubuntu~raring_amd64.deb
	wget http://download.virtualbox.org/virtualbox/4.3.40/Oracle_VM_VirtualBox_Extension_Pack-4.3.40-110317a.vbox-extpack
	dpkg -i virtualbox-4.3_4.3.40-110317~Ubuntu~raring_amd64.deb
	apt-get install -f -y
	/etc/init.d/vboxdrv setup
	VBoxManage extpack install /tmp/Oracle_VM_VirtualBox_Extension_Pack-4.3.40-110317a.vbox-extpack
	usermod -aG vboxusers vbox
	
	
clear 
echo "##########################################################"
echo "####### Instalando Dependencias PhpVirtualBox ############"
echo "##########################################################"
sleep 5s

	apt-get install apache2 php5 libapache2-mod-php5 -y
	apt-get install php-soap -y
	/etc/init.d/apache2 restart

	
clear 
echo "##########################################################"
echo "############### Instalando PhpVirtualBox #################"
echo "##########################################################"
sleep 5s

	
	cd /tmp
	wget https://ufpr.dl.sourceforge.net/project/phpvirtualbox/phpvirtualbox-4.3-3.zip
	unzip /tmp/phpvirtualbox-4.3-3.zip
	rm -rf /var/www/html
	mv /tmp/phpvirtualbox-4.3-3 /var/www/html
	cd /var/www/html/
	cp /var/www/html/config.php-example /var/www/html/config.php
	echo VBOXWEB_USER=vbox >> "/etc/default/virtualbox"
	
	
			#Configuraçoes manuais...
				#Alterar senha do usuario vbox no sistema.
				#Alterar Usuario e senha do Config.php.
	
	clear 
echo "#####################################################################"
echo "########## Instalacao Finalizada - Alter Arquivo config.php #########"
echo "#####################################################################"

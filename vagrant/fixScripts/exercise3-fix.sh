#!/bin/bash
#add fix to exercise3 here
sudo sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/deny from all/Allow from all/gI' /etc/apache2/sites-available/default
sudo /etc/init.d/apache2 restart

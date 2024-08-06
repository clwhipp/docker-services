#!/bin/bash

###############################################################################
# Nextcloud
###############################################################################
function perform_nextcloud_maintenance(){

    echo "Running nextcloud cron.php ..."

    # Run background process in nextcloud for cleanup
    docker exec nextcloud su -c "php -f /var/www/html/cron.php" www-data

}

perform_nextcloud_maintenance

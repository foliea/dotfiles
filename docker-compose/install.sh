if [ ! $COMPOSE ]; then COMPOSE=1.1.0 ; fi

# Install docker-compose
curl -L https://github.com/docker/compose/releases/download/$COMPOSE/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# On darwin, bash completion is installed in brew path
if [ `uname -s` = "Darwin" ]; then
    prefix=`brew --prefix`
fi

# install docker-compose bash completion
curl -L https://raw.githubusercontent.com/docker/compose/$COMPOSE/contrib/completion/bash/docker-compose > $prefix/etc/bash_completion.d/docker-compose

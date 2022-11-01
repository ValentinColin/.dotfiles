#############################################################################
#                                                                           #
#                   ------- Useful Docker Aliases -------                   #
#                                                                           #
#     # Usage:                                                              #
#     d               : docker                                              #
#     dc              : docker compose                                      #
#     dcu             : docker compose up -d                                #
#     dcd             : docker compose down                                 #
#     dex <container> : execute a bash shell inside the RUNNING <container> #
#     di <container>  : docker inspect <container>                          #
#     dim             : docker images                                       #
#     dlc             : docker container list                               #
#     dln             : docker network list                                 #
#     dlv             : docker volume list                                  #
#     dip             : IP addresses of all running containers              #
#     dl <container>  : docker logs -f <container>                          #
#     dnames          : names of all running containers                     #
#     dps             : docker ps                                           #
#     dpsa            : docker ps -a                                        #
#     drmc            : remove all exited containers                        #
#     dsr <container> : stop then remove <container>                        #
#                                                                           #
#############################################################################

function dnames-fn {
	for ID in `docker ps | awk '{print $1}' | grep -v 'CONTAINER'`
	do
    	docker inspect $ID | grep Name | head -1 | awk '{print $2}' | sed 's/,//g' | sed 's%/%%g' | sed 's/"//g'
	done
}

function dip-fn {
    echo "IP addresses of all named running containers"

    for DOC in `dnames-fn`
    do
        IP=`docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}} {{end}}' "$DOC"`
        OUT+=$DOC'\t'$IP'\n'
    done
    echo -e $OUT | column -t
    unset OUT
}

function dex-fn {
	docker exec -it $1 ${2:-bash}
}

function di-fn {
	docker inspect $1
}

function dl-fn {
	docker logs -f $1
}

function dsr-fn {
	docker stop $1;docker rm $1
}

function drmc-fn {
       docker rm $(docker ps --all -q -f status=exited)
}

# in order to do things like dex $(dlab label) sh
function dlab {
       docker ps --filter="label=$1" --format="{{.ID}}"
}

function dc-fn {
        docker compose $*
}

alias d=docker
alias dc=dc-fn
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dex=dex-fn
alias di=di-fn
alias dim="docker images"
alias dlc="docker container list"
alias dln="docker network list"
alias dlv="docker volume list"
alias dip=dip-fn
alias dl=dl-fn
alias dnames=dnames-fn
alias dps="docker ps"
alias dpsa="docker ps -a"
alias drmc=drmc-fn
alias dsp="docker system prune --all"
alias dsr=dsr-fn

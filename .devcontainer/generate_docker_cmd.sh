#!/usr/bin/env bash
function output_cmd () {
    local output_dir=$1
    local arg=( `echo $2 | tr -s '@' ' '`)
    if [ ${#arg[@]} -ne 2 ]; then
        echo 'argument format is not correct!' 1>&2
        echo 'format="command_path@service_name"' 1>&2
        exit 1
    fi
    local command_path=${arg[0]}
    local command_name=`basename ${arg[0]}`
    local service_name=${arg[1]}
    echo "command_path=${command_path}, service_name=${service_name}"
    { \
        echo '#!/bin/sh -e'; \
        echo 'if [ -t 1 ]; then'; \
        echo '    exec docker exec -it -w $PWD '"${COMPOSE_PROJECT_NAME}_${service_name}_1 ${command_path}"' "$@"'; \
        echo 'else'; \
        echo '    exec docker exec -i -w $PWD '"${COMPOSE_PROJECT_NAME}_${service_name}_1 ${command_path}"' "$@"'; \
        echo 'fi'; \
    } > ${output_dir}/${command_name}
chmod +x ${output_dir}/${command_name}
}

if [ $# -eq 0 ]; then
    echo 'no arguments is specified!' 1>&2
    script_name=${0##*/}
    echo 'usage="'"${script_name}"' output_dir command_path@service_name1 command_path2@service_name2 ..."' 1>&2
    exit 1
fi

output_dir=$1
args=( ${@:2} ) # exclude first element
echo "output_dir = ${output_dir}, arguments = ${args[@]}"

for arg in "${args[@]}"; do
    output_cmd ${output_dir} ${arg}
done

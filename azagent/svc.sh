#!/bin/bash

SVC_NAME=`systemd-escape --path "vsts.agent.punjabidrashti.Demo-Dev Server Group.ip-172-31-21-77.us-east-.service"`
SVC_DESCRIPTION="Azure Pipelines Agent (punjabidrashti.Demo-Dev Server Group.ip-172-31-21-77.us-east-2.compute.internal)"

SVC_CMD=$1
arg_2=${2}

AGENT_ROOT=`pwd`

UNIT_PATH=/etc/systemd/system/${SVC_NAME}
TEMPLATE_PATH=./bin/vsts.agent.service.template
TEMP_PATH=./bin/vsts.agent.service.temp
CONFIG_PATH=.service

user_id=`id -u`

# systemctl must run as sudo
# this script is a convenience wrapper around systemctl
if [ $user_id -ne 0 ]; then
    echo "Must run as sudo"
    exit 1
fi

function failed()
{
   local error=${1:-Undefined error}
   echo "Failed: $error" >&2
   exit 1
}

if [ ! -f "${TEMPLATE_PATH}" ]; then
    failed "Must run from agent root or install is corrupt"
fi

#check if we run as root
if [[ $(id -u) != "0" ]]; then
    echo "Failed: This script requires to run with sudo." >&2
    exit 1
fi

function install()
{
    echo "Creating launch agent in ${UNIT_PATH}"
    if [ -f "${UNIT_PATH}" ]; then
        failed "error: exists ${UNIT_PATH}"
    fi

    if [ -f "${TEMP_PATH}" ]; then
      rm "${TEMP_PATH}" || failed "failed to delete ${TEMP_PATH}"
    fi

    # can optionally use username supplied
    run_as_user=${arg_2:-$SUDO_USER}
    echo "Run as user: ${run_as_user}"

    run_as_uid=$(id -u ${run_as_user}) || failed "User does not exist"
    echo "Run as uid: ${run_as_uid}"

    run_as_gid=$(id -g ${run_as_user}) || failed "Group not available"
    echo "gid: ${run_as_gid}"

    sed "s/{{User}}/${run_as_user}/g; s/{{Description}}/$(echo ${SVC_DESCRIPTION} | sed -e 's/[\/&]/\\&/g')/g; s/{{AgentRoot}}/$(echo ${AGENT_ROOT} | sed -e 's/[\/&]/\\&/g')/g;" "${TEMPLATE_PATH}" > "${TEMP_PATH}" || failed "failed to create replacement temp file"
    mv "${TEMP_PATH}" "${UNIT_PATH}" || failed "failed to copy unit file"
    
    # unit file should not be executable and world writable
    chmod 664 "${UNIT_PATH}" || failed "failed to set permissions on ${UNIT_PATH}"
    systemctl daemon-reload || failed "failed to reload daemons"
    
    # Since we started with sudo, runsvc.sh will be owned by root. Change this to current login user.    
    cp ./bin/runsvc.sh ./runsvc.sh || failed "failed to copy runsvc.sh"
    chown ${run_as_uid}:${run_as_gid} ./runsvc.sh || failed "failed to set owner for runsvc.sh"
    chmod 755 ./runsvc.sh || failed "failed to set permission for runsvc.sh"

    systemctl enable ${SVC_NAME} || failed "failed to enable ${SVC_NAME}"

    echo "${SVC_NAME}" > ${CONFIG_PATH} || failed "failed to create .service file"
    chown ${run_as_uid}:${run_as_gid} ${CONFIG_PATH} || failed "failed to set permission for ${CONFIG_PATH}"
}

function start()
{
    systemctl start ${SVC_NAME} || failed "failed to start ${SVC_NAME}"
    status    
}

function stop()
{
    systemctl stop ${SVC_NAME} || failed "failed to stop ${SVC_NAME}"    
    status
}

function uninstall()
{
    stop
    systemctl disable ${SVC_NAME} || failed "failed to disable  ${SVC_NAME}"
    rm "${UNIT_PATH}" || failed "failed to delete ${UNIT_PATH}"
    if [ -f "${CONFIG_PATH}" ]; then
      rm "${CONFIG_PATH}" || failed "failed to delete ${CONFIG_PATH}"
    fi
    systemctl daemon-reload || failed "failed to reload daemons"
}

function status()
{
    if [ -f "${UNIT_PATH}" ]; then
        echo
        echo "${UNIT_PATH}"
    else
        echo
        echo "not installed"
        echo
        return
    fi

    systemctl --no-pager status ${SVC_NAME}
}

function usage()
{
    echo
    echo Usage:
    echo "./svc.sh [install, start, stop, status, uninstall]"
    echo "Commands:"
    echo "   install [user]: Install agent service as Root or specified user."
    echo "   start: Manually start the agent service."
    echo "   stop: Manually stop the agent service."
    echo "   status: Display status of agent service."
    echo "   uninstall: Uninstall agent service."
    echo
}

case $SVC_CMD in
   "install") install;;
   "status") status;;
   "uninstall") uninstall;;
   "start") start;;
   "stop") stop;;
   "status") status;;
   *) usage;;
esac

exit 0

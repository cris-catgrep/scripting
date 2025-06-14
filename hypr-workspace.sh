#!/bin/bash

#Script que lanza una notificación de Dunst al moverse de escritorio

workspace-notify () {

    hyprctl dispatch workspace $1 && dunstify --urgency=critical "Workspace $1"

}

workspace-notify $1


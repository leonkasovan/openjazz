#!/bin/sh
progdir=$(dirname "$0")/Jazz\ Jackrabbit
cd "$progdir"
HOME=$progdir

cd game
../OpenJazz
sync

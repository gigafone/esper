#!/usr/bin/env bash
set -eu

# Use this to set your JAVA_HOME.
# (Some prefer to set this in their shell.)
# JAVA_HOME=""

# Local Java Classpath
# (Includes local Esper build results, if present)
ESPER="../../esper"
LCP="$ESPER/target/classes"\
":$ESPER/lib/commons-logging-1.1.3.jar"\
":$ESPER/lib/cglib-nodep-3.1.jar"\
":$ESPER/lib/antlr-runtime-4.1.jar"\
":$ESPER/lib/log4j-1.2.17.jar"

# Java Classpath
# Checks for a local Esper build (see $LCP above) or a JAR in ./lib
CP="etc:bin"\
":$LCP"\
":lib/esper-5.3.0.jar"\
":lib/commons-logging-1.1.3.jar"\
":lib/cglib-nodep-3.1.jar"\
":lib/antlr-runtime-4.1.jar"\
":lib/log4j-1.2.17.jar"

# JVM options
OPT="-Xms1024m -Xmx1024m"

SIM=""
# Uncomment for simulation without client
# SIM="-rate 2x10000"

# Default to synchronous control flow
QUEUE="-queue -1"

# JMX - if available
CP="$CP:lib/esperjmx-1.0.0.jar"
set OPT="$OPT -Dcom.sun.management.jmxremote.port=1099"\
" -Dcom.sun.management.jmxremote.authenticate=false"\
" -Dcom.sun.management.jmxremote.ssl=false"

$JAVA_HOME/bin/java $OPT\
 -classpath $CP\
 -Desper.benchmark.symbol=1000\
 com.espertech.esper.example.benchmark.server.Server\
 $QUEUE -stat 10 -mode STP $SIM\
 2>&1 | tee benchmark-server.log

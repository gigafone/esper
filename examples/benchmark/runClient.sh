#!/usr/bin/env bash
set -eu

# Use this to set your JAVA_HOME.
# (Some prefer to set this in their shell.)
# JAVA_HOME=""

# Local Java Classpath
# (Includes local Esper build results, if present)
ESPER="../../esper"
LCP="$ESPER/target/classes"\
":target/classes"\
":$ESPER/lib/commons-logging-1.1.3.jar"\
":$ESPER/lib/cglib-nodep-3.1.jar"\
":$ESPER/lib/antlr-runtime-4.1.jar"\
":$ESPER/lib/log4j-1.2.17.jar"

# Java Classpath
# Checks for a local Esper build (see $LCP above) or a JAR in ./lib
CP="etc:bin"\
":$LCP"\
":lib/esper-5.3.0.jar"\
":lib/esper_examples_benchmark-5.3.0.jar"\
":lib/commons-logging-1.1.3.jar"\
":lib/cglib-nodep-3.1.jar"\
":lib/antlr-runtime-4.1.jar"\
":lib/log4j-1.2.17.jar"

# JVM options
OPT="-Xms128m -Xmx128m"

# Rate
RATE="-rate 10000"

# remote host, we default to localhost and default port
HOST="-host 127.0.0.1"

$JAVA_HOME/bin/java $OPT\
 -classpath $CP\
 -Desper.benchmark.symbol=1000\
 com.espertech.esper.example.benchmark.client.Client\
 $RATE $HOST\
 2>&1 | tee benchmark-client.log

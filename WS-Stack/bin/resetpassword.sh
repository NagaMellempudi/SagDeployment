#!/bin/sh

#  Copyright 2001,2004-2006 The Apache Software Foundation
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

# ----------------------------------------------------------------------------
# Script for resetting the Axis2 administration password
#
# Environment Variable Prequisites
#
#   AXIS2_HOME   Home of Axis2 installation. If not set I will  try
#                   to figure it out.
#
#   JAVA_HOME       Must point at your Java Development Kit installation.
#
# -----------------------------------------------------------------------------

# Get the context and from that find the location of setenv.sh
. `dirname $0`/setenv.sh

"$JAVA_HOME/bin/java" -jar "$AXIS2_HOME/miscellaneous/lib/axis2-reset-password-tool.jar" $*

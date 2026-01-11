	[-report [-live] [-dead] [-decommissioning]]
	[-safemode <enter | leave | get | wait>]
	[-saveNamespace]
	[-rollEdits]
	[-restoreFailedStorage true|false|check]
	[-refreshNodes]
	[-setQuota <quota> <dirname>...<dirname>]
	[-clrQuota <dirname>...<dirname>]
	[-setSpaceQuota <quota> <dirname>...<dirname>]
	[-clrSpaceQuota <dirname>...<dirname>]
	[-finalizeUpgrade]
	[-rollingUpgrade [<query|prepare|finalize>]]
	[-refreshServiceAcl]
	[-refreshUserToGroupsMappings]
	[-refreshSuperUserGroupsConfiguration]
	[-refreshCallQueue]
	[-refresh <host:ipc_port> <key> [arg1..argn]
	[-reconfig <datanode|...> <host:ipc_port> <start|status>]
	[-printTopology]
	[-refreshNamenodes datanode_host:ipc_port]
	[-deleteBlockPool datanode_host:ipc_port blockpoolId [force]]
	[-setBalancerBandwidth <bandwidth in bytes per second>]
	[-fetchImage <local directory>]
	[-allowSnapshot <snapshotDir>]
	[-disallowSnapshot <snapshotDir>]
	[-shutdownDatanode <datanode_host:ipc_port> [upgrade]]
	[-getDatanodeInfo <datanode_host:ipc_port>]
	[-metasave filename]
	[-triggerBlockReport [-incremental] <datanode_host:ipc_port>]
	[-help [cmd]]

Generic options supported are
-conf <configuration file>     specify an application configuration file
-D <property=value>            use value for given property
-fs <local|namenode:port>      specify a namenode
-jt <local|resourcemanager:port>    specify a ResourceManager
-files <comma separated list of files>    specify comma separated files to be copied to the map reduce cluster
-libjars <comma separated list of jars>    specify comma separated jar files to include in the classpath.
-archives <comma separated list of archives>    specify comma separated archives to be unarchived on the compute machines.

The general command line syntax is
bin/hadoop command [genericOptions] [commandOptions]




Configured Capacity: 31244361728 (29.10 GB)
Present Capacity: 22430261248 (20.89 GB)
DFS Remaining: 22030618624 (20.52 GB)
DFS Used: 399642624 (381.13 MB)
DFS Used%: 1.78%
Under replicated blocks: 2
Blocks with corrupt replicas: 1
Missing blocks: 1
Missing blocks (with replication factor 1): 5

-------------------------------------------------
Live datanodes (1):

Name: 127.0.0.1:50010 (quickstart.cloudera)
Hostname: quickstart.cloudera
Decommission Status : Normal
Configured Capacity: 31244361728 (29.10 GB)
DFS Used: 399642624 (381.13 MB)
Non DFS Used: 8814100480 (8.21 GB)
DFS Remaining: 22030618624 (20.52 GB)
DFS Used%: 1.28%
DFS Remaining%: 70.51%
Configured Cache Capacity: 0 (0 B)
Cache Used: 0 (0 B)
Cache Remaining: 0 (0 B)
Cache Used%: 100.00%
Cache Remaining%: 0.00%
Xceivers: 2
Last contact: Fri Feb 18 04:52:03 PST 2022



/var/log/hadoop-yarn/apps/cloudera/logs/application_1577793139859_0005/quickstart.cloudera_38789 204806 bytes, 1 block(s):  OK



/hbase/.hbck/hbase-1577006422260/data/hbase/meta/1588230740/info/c28ac4f387e14179878a37372b96ed36

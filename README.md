# Linux In Use RPMs
Scripts for collecting Linux software utilization metrics

Build Linux software utilization metrics based on threat response recorder data. This should be built as a package / sensor combo where the package collects information from the TTR recorder data + rpmdb and stashes data to be picked up by sensor. Theory of operation:

1. List all programs that have been run from recorder db.
2. Inspect the programs (using ldd and similar) to determine what rpm packages were needed to execute the program.
3. Record the rpm package name and the datetime it was used.

Sensor code can use the list of datetime and rpm package name to make the following kinds of reports (I expect multiple sensors here).

1. Number of times a rpm packages were used in the last X days.
2. Total list of all "in use" rpm packages.
3. List extra installed packages that appear to be unused.
4. MD5 hash of all "in use" rpm packages; this would allow us to automatically group systems that see the same workloads.



# PS-Veeam
These scripts are intended for people with both VMWare vCenter and Veeam with licensing for both. 
They don't include any of the extra help the free version of veeam might require. 

# Pre-requisites
* These should run on a machine with the veeam console installed.
* As shipped, these scripts ignore vms starting with "DEV" or "Test"
* Create-VeeamBackupJobs.ps1 expects you to already have a connection open to your vCenter instance.
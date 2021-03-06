#Annotations
$srccluster = Read-Host "Name of source cluster"

$vmanoncsv = Import-Csv "$srccluster-vms-Annotations.csv" 
#$vmanoncsv = Import-Csv "All-vms-Annotations.csv" 

$hostanoncsv = Import-Csv "$srccluster-Host-Annotations.csv" 
#$hostanoncsv = Import-Csv "All-Host-Annotations.csv" 

#VM Annotations

foreach($vmline in $vmanoncsv){
	$vm = Get-VM -Name $vmline.Name
#	$vmName = $vmanoncsv.Name

write-host "vmline.name: " + $vmline.Name + "" -foregroundcolor Green
write-host "VM: " + $vm + "" -foregroundcolor Green
#write-host "VMName: "$vmName

#pause

	$vmApplicationTeam = $vmline.ApplicationTeam
	$vm | Set-Annotation -Value $vmApplicationTeam -CustomAttribute "Application Team"
	
#pause
	
	$vmBackupRequirements = $vmline.BackupRequirements
	$vm | Set-Annotation -Value $vmBackupRequirements -CustomAttribute "Backup Requirements"
	
	$vmBuildProfile = $vmline.BuildProfile
	$vm | Set-Annotation -Value $vmBuildProfile -CustomAttribute "Build Profile"
	

	
	$vmCAPPLANID = $vmline.CAPPLANID
	$vm | Set-Annotation -Value $vmCAPPLANID -CustomAttribute "CAPPLAN-ID"
	
	$vmCreated = $vmline.Created
	$vm | Set-Annotation -Value $vmCreated -CustomAttribute "Created"
	
	$vmDomain = $vmline.Domain
	$vm | Set-Annotation -Value $vmDomain -CustomAttribute "Domain"
	
	$vmEmailContact = $vmline.EmailContact
	$vm | Set-Annotation -Value $vmEmailContact -CustomAttribute "Email Contact"
	
	$vmManagedBy = $vmline.ManagedBy
	$vm | Set-Annotation -Value $vmManagedBy -CustomAttribute "Managed By"
	
	$vmNIC1DNSZone = $vmline.NIC1DNSZone
	$vm | Set-Annotation -Value $vmNIC1DNSZone -CustomAttribute "NIC1 DNS Zone"
	
	$vmNIC1Gateway = $vmline.NIC1Gateway
	$vm | Set-Annotation -Value $vmNIC1Gateway -CustomAttribute "NIC1 Gateway"
	
	$vmNIC1IP = $vmline.NIC1IP
	$vm | Set-Annotation -Value $vmNIC1IP -CustomAttribute "NIC1 IP"
	
	$vmNIC1MAC = $vmline.NIC1MAC
	$vm | Set-Annotation -Value $vmNIC1MAC -CustomAttribute "NIC1 MAC"
	
	$vmNIC1Subnet = $vmline.NIC1Subnet
	$vm | Set-Annotation -Value $vmNIC1Subnet -CustomAttribute "NIC1 Subnet"
	
	$vmNIC2DNSZone = $vmline.NIC2DNSZone
	$vm | Set-Annotation -Value $vmNIC2DNSZone -CustomAttribute "NIC2 DNS Zone"
	
	$vmNIC2Gateway = $vmline.NIC2Gateway
	$vm | Set-Annotation -Value $vmNIC2Gateway -CustomAttribute "NIC2 Gateway"
	
	$vmNIC2IP = $vmline.NIC2IP
	$vm | Set-Annotation -Value $vmNIC2IP -CustomAttribute "NIC2 IP"
	
	$vmNIC2MAC = $vmline.NIC2MAC
	$vm | Set-Annotation -Value $vmNIC2MAC -CustomAttribute "NIC2 MAC"
	
	$vmNIC2Subnet = $vmline.NIC2Subnet
	$vm | Set-Annotation -Value $vmNIC2Subnet -CustomAttribute "NIC2 Subnet"
	
	$vmNoBackupReason = $vmline.NoBackupReason
	$vm | Set-Annotation -Value $vmNoBackupReason -CustomAttribute "No Backup Reason"
	
	$vmOSBuildStatus = $vmline.OSBuildStatus
	$vm | Set-Annotation -Value $vmOSBuildStatus -CustomAttribute "OS Build Status"
	
	$vmOperatingSystem = $vmline.OperatingSystem
	$vm | Set-Annotation -Value $vmOperatingSystem -CustomAttribute "Operating System"
	
	$vmProject = $vmline.Project
	$vm | Set-Annotation -Value $vmProject -CustomAttribute "Project"
	
	$vmSecurityZone = $vmline.SecurityZone
	$vm | Set-Annotation -Value $vmSecurityZone -CustomAttribute "Security Zone"
	
	$vmSystem = $vmline.System
	$vm | Set-Annotation -Value $vmSystem -CustomAttribute "System"

	$vmVendor = $vmline.Vendor
	$vm | Set-Annotation -Value $vmVendor -CustomAttribute "Vendor"

	$vmService = $vmline.Service
	$vm | Set-Annotation -Value $vmService -CustomAttribute "Service"
	


}

#Host Annotations


foreach($vmhostline in $hostanoncsv){

	$vmhost =  get-vmHost -Name $vmhostline.Name
	$anonbladechassis = $vmhostline.BladeChassis
	$vmhost | Set-Annotation -Value $anonbladechassis -CustomAttribute "Blade Chassis"


}

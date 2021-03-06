#Annotations



#VM Annotations

Write-Host "Starting Exporting VM Annotations"

#Get-Datacenter | Select Name
#$datacenter = Read-Host "Please give the name of the datacenter you would like to run against"

Get-Cluster | Select Name
$cluster = Read-Host "Type name of cluster"

$vms = get-cluster -Name $cluster | get-vm
#$vms = get-vm

$results1 = @()
foreach($vm in $vms){
$vm.Name
$annons = $vm | Get-Annotation


$row1 = "" | Select Name, ApplicationTeam, BackupRequirements, BuildProfile, CAPPLANID, Created, Domain, EmailContact, ManagedBy, NIC1DNSZone, NIC1Gateway, NIC1IP, NIC1MAC, NIC1Subnet, NIC2DNSZone, NIC2Gateway, NIC2IP, NIC2MAC, NIC2Subnet, NoBackupReason, OSBuildStatus, OperatingSystem, Project, SecurityZone, Service, System, Vendor, VMName
$row1.Name = $vm.Name

$ApplicationTeam = $vm | Get-Annotation -Name "Application Team"
$row1.ApplicationTeam = $ApplicationTeam.Value

$BackupRequirements = $vm | Get-Annotation -Name "Backup Requirements"
$row1.BackupRequirements = $BackupRequirements.Value

$BuildProfile = $vm | Get-Annotation -Name "Build Profile"
$row1.BuildProfile = $BuildProfile.Value



$CAPPLANID = $vm | Get-Annotation -Name "CAPPLAN-ID"
$row1.CAPPLANID = $CAPPLANID.Value

$Created = $vm | Get-Annotation -Name "Created"
$row1.Created = $Created.Value

$Domain = $vm | Get-Annotation -Name "Domain"
$row1.Domain = $Domain.Value

$EmailContact = $vm | Get-Annotation -Name "Email Contact"
$row1.EmailContact = $EmailContact.Value

$ManagedBy = $vm | Get-Annotation -Name "Managed By"
$row1.ManagedBy = $ManagedBy.Value

$NIC1DNSZone = $vm | Get-Annotation -Name "NIC1 DNS Zone"
$row1.NIC1DNSZone = $NIC1DNSZone.Value

$NIC1Gateway = $vm | Get-Annotation -Name "NIC1 Gateway"
$row1.NIC1Gateway = $NIC1Gateway.Value

$NIC1IP = $vm | Get-Annotation -Name "NIC1 IP"
$row1.NIC1IP = $NIC1IP.Value

$NIC1MAC = $vm | Get-Annotation -Name "NIC1 MAC"
$row1.NIC1MAC = $NIC1MAC.Value

$NIC1Subnet = $vm | Get-Annotation -Name "NIC1 Subnet"
$row1.NIC1Subnet = $NIC1Subnet.Value

$NIC2DNSZone = $vm | Get-Annotation -Name "NIC2 DNS Zone"
$row1.NIC2DNSZone = $NIC2DNSZone.Value

$NIC2Gateway = $vm | Get-Annotation -Name "NIC2 Gateway"
$row1.NIC2Gateway = $NIC2Gateway.Value

$NIC2IP = $vm | Get-Annotation -Name "NIC2 IP"
$row1.NIC2IP = $NIC2IP.Value

$NIC2MAC = $vm | Get-Annotation -Name "NIC2 MAC"
$row1.NIC2MAC = $NIC2MAC.Value

$NIC2Subnet = $vm | Get-Annotation -Name "NIC2 Subnet"
$row1.NIC2Subnet = $NIC2Subnet.Value

$NoBackupReason = $vm | Get-Annotation -Name "No Backup Reason"
$row1.NoBackupReason = $NoBackupReason.Value

$OSBuildStatus = $vm | Get-Annotation -Name "OS Build Status"
$row1.OSBuildStatus = $OSBuildStatus.Value

$OperatingSystem = $vm | Get-Annotation -Name "Operating System"
$row1.OperatingSystem = $OperatingSystem.Value

$Project = $vm | Get-Annotation -Name "Project"
$row1.Project = $Project.Value

$SecurityZone = $vm | Get-Annotation -Name "Security Zone"
$row1.SecurityZone = $SecurityZone.Value

$Service = $vm | Get-Annotation -Name "Service"
$row1.Service = $Service.Value

$System = $vm | Get-Annotation -Name "System"
$row1.System = $System.Value

$Vendor = $vm | Get-Annotation -Name "Vendor"
$row1.Vendor = $Vendor.Value

$VMName = $vm | Get-Annotation -Name "VM Name"
$row1.VMName = $VMName.Value


$results1 += $row1

$ApplicationTeam = $null
$BackupRequirements = $null
$BuildProfile = $null
$CAPPLANID = $null
$Created = $null
$Domain = $null
$EmailContact = $null
$ManagedBy = $null
$NIC1DNSZone = $null
$NIC1Gateway = $null
$NIC1IP = $null
$NIC1MAC = $null
$NIC1Subnet = $null
$NIC2DNSZone = $null
$NIC2Gateway = $null
$NIC2IP = $null
$NIC2MAC = $null
$NIC2Subnet = $null
$NoBackupReason = $null
$OSBuildStatus = $null
$OperatingSystem = $null
$Project = $null
$SecurityZone = $null
$Service = $null
$System = $null
$Vendor = $null
$VMName = $null

}


$results1 | Export-Csv "$cluster-vms-Annotations.csv" -NoTypeInformation
#$results1 | Export-Csv "All-vms-Annotations.csv" -NoTypeInformation

#Host Annotations
Write-Host "Starting Exporting Host Annotations"

$vmhosts = get-cluster -Name $cluster | Get-VMHost 
#$vmhosts = Get-VMHost 

$results2 = @()
foreach($vmhost in $vmhosts){
$vmhost.Names

$row2 = "" | Select Name,BladeChassis

$row2.Name = $vmhost.Name

$BladeChassis = $vmhost | Get-Annotation -Name "Blade Chassis"
$row2.BladeChassis = $BladeChassis.Value

$results2 += $row2

$BladeChassis = $null
}

$results2 | Export-Csv "$cluster-Host-Annotations.csv" -NoTypeInformation
#$results2 | Export-Csv "All-Host-Annotations.csv" -NoTypeInformation
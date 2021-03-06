Import-Module AutomatedLab
#Here AL installs a lab with one domain controller and one client. The OS can be configured quite easily as well as
#the domain name or memory. AL takes care about network settings like in the previous samples.

New-LabDefinition -Name Lab1 -DefaultVirtualizationEngine HyperV -VmPath C:\AutomatedLab-VMs\VMs

#defining default parameter values, as these ones are the same for all the machines
$PSDefaultParameterValues = @{
    'Add-LabMachineDefinition:DomainName' = 'pomfret.com'
    'Add-LabMachineDefinition:Memory' = 1GB
    'Add-LabMachineDefinition:OperatingSystem' = 'Windows Server 2019 Datacenter (Desktop Experience)'
}

Add-LabMachineDefinition -Name DC -Roles RootDC
Add-LabMachineDefinition -Name DscSvr1
Add-LabMachineDefinition -Name DscSvr2

Install-Lab

Show-LabDeploymentSummary -Detailed

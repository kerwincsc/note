# 内存大小检测脚本
# 2018.03.16

$a = (Get-WmiObject -class Win32_PhysicalMemory -Namespace "root/cimv2").Capacity
$b = (Get-WmiObject -class Win32_PerfFormattedData_PerfOS_Memory -Namespace "root/cimv2").AvailableMBytes
$c = $a/1024/1024
$d = $c-$b
#cls
echo 您当前总内存$c 可用内存$b 已用内存$d
pause
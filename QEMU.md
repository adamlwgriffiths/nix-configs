# QEmu Notes

## Secure Boot

Secure boot prevents Linux images booting
On boot
1. <ESC>
2. Disable secure boot

## UEFI

SCSI HDDs (default in Proxmox) are not supported by QEMU UEFI.
Use SATA.

After installing from ISO:
1. Restart system
2. <ESC>
3. Boot Maintenance Manager -> Boot Options -> Change Boot Order
4. Select '<UEFI QEMU HARDDISK ....>'
5. Press '+' until it is under '<UEFI QEMU DVD-ROM ...>'
6. Save with <F10> -> Y
7. Navigate to the home menu and select 'Continue'. Do **NOT** select 'Reset'.

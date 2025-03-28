# terraform-proxmox-vm-qemu
Terraform module to create a virtual machine (server or desktop) on Proxmox VE.

## Terraform Registry

This module is published on the official Terraform Registry:

[lsampaioweb/vm-qemu/proxmox](https://registry.terraform.io/modules/lsampaioweb/vm-qemu/proxmox/latest)

You can use it directly in your Terraform configuration:

```hcl
module "vm_qemu" {
  source  = "lsampaioweb/vm-qemu/proxmox"
  version = "1.0.14"

  name       = "my-vm"
  node_name  = "pve-node01"
  cores      = 2
  memory     = 2048
  disk_gb    = 10
  ip_address = "dhcp"
}
```

## Preparing the Proxmox VE Node

1. Create the user that Terraform will use

    This creates a dedicated user account in Proxmox for Terraform.

    Replace `XXX@gmail.com` with your actual email address.

    ```bash
    pveum user add terraform@pve --firstname "Terraform" --email "YOUR_EMAIL@example.com" --comment "The user that Terraform will use."
    ```

1. Create a password for the user

    You should use a strong password. You can generate one using `uuid` as an example.
    ```bash
    uuid
    pveum passwd terraform@pve
    ```

    Then, save the password in the secret manager
    ```bash
    secret-tool store --label="proxmox-terraform-password" password proxmox-terraform-password
    ```

1. Create a token for the user

    ```bash
    pveum user token add terraform@pve terraform --comment "The token that Terraform will use."
    ```

    Then, save the token in the secret manager
    ```bash
    secret-tool store --label="proxmox-terraform-token" token proxmox-terraform-token
    ```

1. Create a role for the user and set the permissions

    ```bash
    pveum roleadd Terraform -privs "Datastore.AllocateSpace, Datastore.Audit, Group.Allocate, Pool.Audit, Pool.Allocate, Sys.Audit, Sys.Console, Sys.Modify, VM.Allocate, VM.Audit, VM.Clone, VM.Config.CDROM, VM.Config.CPU, VM.Config.Cloudinit, VM.Config.Disk, VM.Config.HWType, VM.Config.Memory, VM.Config.Network, VM.Config.Options, VM.Console, VM.Migrate, VM.Monitor, VM.PowerMgmt, SDN.Use"
    ```

    ### Proxmox Role Permissions Explained

    | Permission                       | Description                                                                 |
    |----------------------------------|-----------------------------------------------------------------------------|
    | Datastore.AllocateSpace          | Allows allocation of storage space for new VM disks.                        |
    | Datastore.Audit                  | Grants read-only access to storage content and usage info.                  |
    | Group.Allocate                   | Allows the user to assign groups to VMs or users.                           |
    | Pool.Audit                       | Grants read-only access to VM pools and their members.                      |
    | Pool.Allocate                    | Allows creating and assigning VMs to pools.                                 |
    | Sys.Audit                        | Grants read-only access to system-wide information and configuration.       |
    | Sys.Console                      | Allows access to the console of VMs.                                        |
    | Sys.Modify                       | Permits modification of system settings, including users and roles.         |
    | VM.Allocate                      | Allows creation of new VMs.                                                 |
    | VM.Audit                         | Grants read-only access to VM configuration and status.                     |
    | VM.Clone                         | Allows cloning existing VMs or templates.                                   |
    | VM.Config.CDROM                  | Allows modification of VM CD/DVD drive settings.                            |
    | VM.Config.CPU                    | Permits changing the number of CPU cores or sockets.                        |
    | VM.Config.Cloudinit              | Allows configuration of Cloud-Init parameters.                              |
    | VM.Config.Disk                   | Grants permission to add/modify/remove virtual disks.                       |
    | VM.Config.HWType                 | Allows changing VM hardware type (e.g., BIOS, machine type).                |
    | VM.Config.Memory                 | Permits changing allocated RAM for the VM.                                  |
    | VM.Config.Network                | Allows adding/editing VM network interfaces.                                |
    | VM.Config.Options                | Allows modification of general VM options (e.g., boot order).               |
    | VM.Console                       | Grants access to the interactive console of the VM.                         |
    | VM.Migrate                       | Allows live or offline migration of VMs between nodes.                      |
    | VM.Monitor                       | Grants ability to send monitor commands (e.g., QEMU monitor).               |
    | VM.PowerMgmt                     | Allows VM start, stop, reboot, shutdown operations.                         |
    | SDN.Use                          | Grants permission to use Software Defined Networking (SDN) resources.       |

1. Set the role to the user and API Token

    ```bash
    pveum acl modify / -user terraform@pve -role Terraform
    pveum acl modify / -token 'terraform@pve!terraform' -role Terraform
    ```

## Configuring Environment Variables

1. Add the API token of the user to the ~/.bashrc file

    ```bash
    echo 'export PM_API_TOKEN_SECRET=$(secret-tool lookup token "proxmox-terraform-token")' >> ~/.bashrc
    ```

1. Reload your shell configuration

    ```bash
    source ~/.bashrc
    ```

## Running the Examples

Run these commands on the computer that is running Terraform:

1. Run an example

    To auto-approve the execution, add `-auto-approve` to the command.

    ```bash
    ./tf.sh apply 01-bare-minimum -auto-approve
    ```

1. Run the basic example

    This example creates a **bare minimum VM** on Proxmox VE using the default settings.

    ```bash
    ./tf.sh apply 01-bare-minimum
    ```

1. Run the DHCP configuration example

    This example creates a VM with **DHCP-based network configuration**.

    ```bash
    ./tf.sh apply 02-dhcp
    ```

1. Run the static IP example

    This example creates a VM configured with a **static IP address**.

    ```bash
    ./tf.sh apply 03-static-ip
    ```

1. Run the additional disks example

    This example demonstrates attaching **additional virtual disks** to the VM.

    ```bash
    ./tf.sh apply 04-disks
    ```

1. Run the multiple networks example

    This example configures the VM with **multiple network interfaces**.

    ```bash
    ./tf.sh apply 05-networks
    ```

1. Run the other attributes example

    This example shows how to override **additional advanced VM settings**.

    ```bash
    ./tf.sh apply 06-other
    ```

1. Run all examples

    To execute **all example configurations** in sequence, run.

    ```bash
    ./run-all.sh apply
    ```

1. Destroy all examples

    To clean up and **remove all resources** created by the examples.

    ```bash
    ./run-all.sh destroy
    ```

1. Creating a Release

    To version and release the module so it can be imported into other Terraform projects.

    1. List existing tags.
        ```bash
        git tag
        ```

    1. Create a new version tag.
        ```bash
        git tag -a 1.0.14 -m "Release version 1.0.14"
        ```

    1. Push the new tag to the repository.
        ```bash
        git push --tags
        ```

## Complete Projects

- [Load Balancer](https://github.com/lsampaioweb/load-balancer) – Repository with scripts to set up an Ubuntu server with Traefik installed.

## License

This project is licensed under the MIT License – see the [LICENSE](LICENSE "MIT License") file for details.

## Created by

Luciano Sampaio

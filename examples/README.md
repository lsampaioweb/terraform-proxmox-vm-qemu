# terraform-proxmox-vm-qemu
Terraform module to create a virtual machine (server or desktop) on Proxmox VE.

## Getting Started

Run these commands on the computer that is running Terraform:

1. **Initialize the project:**
    ```bash
    cd examples/
    terraform init
    ```

1. **Run an example:**

    To auto-approve the execution, add `-auto-approve` to the command.
    ```bash
    ./tf.sh apply 01-bare-minimum -auto-approve
    ./tf.sh destroy 01-bare-minimum

    ./tf.sh apply 01-bare-minimum
    ./tf.sh apply 02-dhcp
    ./tf.sh apply 03-static-ip
    ./tf.sh apply 04-disks
    ./tf.sh apply 05-networks
    ./tf.sh apply 06-other
    ```

1. **Run all examples:**
    ```bash
    ./run-all.sh apply
    ./run-all.sh destroy
    ```

1. **Create a release to be imported into other Terraform projects:**
    ```bash
    git tag
    git tag -a 1.0.14 -m "Release version 1.0.14"
    git push --tags
    ```

## Created by

Luciano Sampaio

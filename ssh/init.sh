#!/bin/bash

# my Directory
BASENAME=$(cd `dirname $0`; pwd)

mkdir /root/.ssh
chmod 700 /root/.ssh
touch /root/.ssh/authorized_keys

echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDT3qOTFZXVeM8FpbJ6WnGhO7PtCpSt1ShRJdVwmMUV40uOFcZ8H9VcPMtkeJQYK2bXRrYR7APYP7olFLy+ekXR3Psc4wZtsSSwkqVhfNMXWgwPuRoy6OGlBTMz8pRow5qQZyeGlznuPWsYswRmENF6UCoVFQPMvGQe2hoSBEzPRoNcYgouBWhTJsIcRjZ70H9lNBZcE0HriTEM9FTt9MeijAy8LIcb8p0w2EpXc0xQJgF9SWZcCUFc+74Z7uC/A6Kn4JxeB/SxHaVZhJJL+0WdAshmPMEMgnn+wsbZd43uFHeWrs0c6RWUbviV6zgpc7w6BM7xlYGnlqG1Rp6sJxgP for test key' > /root/.ssh/authorized_keys

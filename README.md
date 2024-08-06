# docker-services
The services on the network makes extensive use of docker and docker compose
from the perspective of running the applications. Containers provide a repeatable
mechanism for downloading and executing an application.

The services within this repository, in general, follow a standard set of paradigms
regardless of the service.

1. Emphasize stability over running latest and greatest.
2. Least Privilege - Applications run under dedicated lower privileged accounts
3. Account Specific TLS - Each application makes use of separate DNS records and associated TLS certificates.

This repository contains the files necessary for building the docker applications. The premise is that this
repository is cloned to the target server. The images are then built on the server that will eventually execute
the software application.

This repository was designed to be executed in combination with an orchestration tool such as ansible. In support
for that, each of the services have a dedicated .env file that is resident next to the docker-compose.yaml
files. The .env files in this repository contain placeholders values and is designed to be replaced as part of
the system orchestration playbook from within ansible.

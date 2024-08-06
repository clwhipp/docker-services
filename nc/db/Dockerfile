FROM mariadb:10.11.2-jammy

# Create user account in container that matches host
RUN useradd -u 1503 -s /sbin/nologin db

# Copy my.cnf file to enable access via TCP to support container use
COPY my.cnf /etc/mysql/my.cnf

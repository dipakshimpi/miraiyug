FROM frappe/bench:latest

# Copy your project files into the container
USER root
COPY --chown=frappe:frappe . /workspace
RUN chmod +x /workspace/docker/init.sh

# Switch back to the frappe user
USER frappe
WORKDIR /workspace

# Start the initialization script
ENTRYPOINT ["bash", "docker/init.sh"]

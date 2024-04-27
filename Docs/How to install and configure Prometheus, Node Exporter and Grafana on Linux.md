# Docs.
```
https://prometheus.io/docs/introduction/overview/
```

```
https://grafana.com/docs/
```


# Update and upgrade the system, for example Debian.
```
sudo apt update -y && sudo apt upgrade -y
```


# Check latest version of Prometheus and Node Exporter.
```
https://github.com/prometheus/prometheus/releases/
```

```
https://github.com/prometheus/node_exporter/releases/
```


# Download the latest version of Prometheus and Node Exporter.
```
cd /tmp/
```

```
curl -LO https://github.com/prometheus/prometheus/releases/download/v2.51.2/prometheus-2.51.2.linux-amd64.tar.gz
```

```
curl -LO https://github.com/prometheus/node_exporter/releases/download/v1.8.0/node_exporter-1.8.0.linux-amd64.tar.gz
```


# Unpack the tarballs.
```
tar -xvf prometheus-2.51.2.linux-amd64.tar.gz
```

```
tar -xvf node_exporter-1.8.0.linux-amd64.tar.gz
```


# Create required directories.
```
sudo mkdir /etc/prometheus
```

```
sudo mkdir /var/lib/prometheus
```


# Copy the files into their respective directories.
```
sudo cp prometheus-2.51.2.linux-amd64/prometheus /usr/local/bin/
```

```
sudo cp prometheus-2.51.2.linux-amd64/promtool /usr/local/bin/
```

```
sudo cp -r prometheus-2.51.2.linux-amd64/consoles /etc/prometheus
```

```
sudo cp -r prometheus-2.51.2.linux-amd64/console_libraries /etc/prometheus
```

```
sudo cp node_exporter-1.8.0.linux-amd64/node_exporter /usr/local/bin/
```


# Create the users for each service.
```
sudo useradd --no-create-home --shell /bin/false prometheus
```

```
sudo useradd --no-create-home --shell /bin/false node_exporter
```


# Create Prometheus and Node Exporter configuration.
```
sudo vi /etc/prometheus/prometheus.yml
```

```
global:
  scrape_interval: 10s

scrape_configs:
  - job_name: 'prometheus'
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost:9090']
  - job_name: 'node_exporter_metrics'
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost:9100']
```


# Create service files.
```
sudo vi /etc/systemd/system/prometheus.service
```

```
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \
    --config.file /etc/prometheus/prometheus.yml \
    --storage.tsdb.path /var/lib/prometheus/ \
    --web.console.templates=/etc/prometheus/consoles \
    --web.console.libraries=/etc/prometheus/console_libraries

[Install]
WantedBy=multi-user.target
```

```
sudo vi /etc/systemd/system/node_exporter.service
```

```
[Unit]
Description=Prometheus Node Exporter
After=network.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
```


# Change ownership or required directories.
```
sudo chown -R prometheus:prometheus /var/lib/prometheus
```

```
sudo chown prometheus:prometheus /usr/local/bin/prometheus
```

```
sudo chown prometheus:prometheus /usr/local/bin/promtool
```

```
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter
```

```
sudo chown -R prometheus:prometheus /etc/prometheus/consoles
```

```
sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
```

```
sudo chown prometheus:prometheus /etc/prometheus
```

```
sudo chown prometheus:prometheus /etc/prometheus/prometheus.yml
```


# Reload the systemd service to register the Prometheus and Node Exporter service.
```
sudo systemctl daemon-reload
```


# Start and Enable the Prometheus and Node Exporter service.
```
sudo systemctl enable --now prometheus
```

```
sudo systemctl enable --now node_exporter
```


# Check status of Prometheus and Node Exporter service.
```
sudo systemctl status prometheus
```

```
sudo systemctl status node_exporter
```

# Sources.
```
https://devopscube.com/install-configure-prometheus-linux/
```

```
https://devopscube.com/monitor-linux-servers-prometheus-node-exporter/
```

```
https://devopscube.com/integrate-visualize-prometheus-grafana/
```



##### Note: Now you will be able to access the prometheus UI on 9090 port of the prometheus server.
```
http://<prometheus-ip>:9090/graph
```
##### Note: Check the target in prometheus web UI.
```
http://<prometheus-IP>:9090/targets
```
##### You can use the prometheus query tab to query the available metrics as shown in the gig below.
##### Right now, we have just configured the Prometheus server. You need to register the target in the prometheus.yml file to get the metrics from the source systems.
##### For example, if you want to monitor ten servers, the IP address of these servers should be added as a target in the Prometheus configuration to scrape the metrics.
##### The server should have Node Exporter installed to collect all the system metrics and make it available for Prometheus to scrap it.
##### Follow this detailed Prometheus Node Exporter Guide (https://devopscube.com/monitor-linux-servers-prometheus-node-exporter/) to setup node exporter and registering it to the Prometheus server. 
##### You can also use this setup as lab for the Prometheus Certified Associate (https://devopscube.com/prometheus-certified-associate/) Certification preparation.
##### Note: Follow “Integrate And Visualize Prometheus Metrics In Grafana (https://devopscube.com/integrate-visualize-prometheus-grafana/)” blog to visualize the node exporter metrics in Grafana.
##### Note: Also, you can use the Prometheus expression browser to query for node related metrics. Following are the few key node metrics you can use to find its statistics.
```
node_memory_MemFree_bytes
```

```
node_cpu_seconds_total
```

```
node_filesystem_avail_bytes
```

```
rate(node_cpu_seconds_total{mode="system"}[1m])
```

```
rate(node_network_receive_bytes_total[1m])
```
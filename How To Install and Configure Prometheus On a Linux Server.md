# I. Setup Prometheus Binaries #

### Step 1: Update the yum package repositories.
```
sudo apt update -y && sudo apt upgrade -y
```

### Step 2: Go to the official Prometheus downloads page and get the latest download link for the Linux binary.
```
https://prometheus.io/download/
```

### Step 3: Download the source using curl, untar it, and rename the extracted folder to prometheus-files.
```
curl -LO url -LO https://github.com/prometheus/prometheus/releases/download/v2.51.2/prometheus-2.51.2.linux-amd64.tar.gz
```
tar -xvf prometheus-2.51.2.linux-amd64.tar.gz
```
mv prometheus-2.51.2.linux-amd64 prometheus-files
```

### Step 4: Create a Prometheus user, required directories, and make Prometheus the user as the owner of those directories.
```
sudo useradd --no-create-home --shell /bin/false prometheus
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus
sudo chown prometheus:prometheus /etc/prometheus
sudo chown prometheus:prometheus /var/lib/prometheus
```

### Step 5: Copy prometheus and promtool binary from prometheus-files folder to /usr/local/bin and change the ownership to prometheus user.
```
sudo cp prometheus-files/prometheus /usr/local/bin/
sudo cp prometheus-files/promtool /usr/local/bin/
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool
```

### Step 6: Move the consoles and console_libraries directories from prometheus-files to /etc/prometheus folder and change the ownership to prometheus user.
```
sudo cp -r prometheus-files/consoles /etc/prometheus
sudo cp -r prometheus-files/console_libraries /etc/prometheus
sudo chown -R prometheus:prometheus /etc/prometheus/consoles
sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
```


# II. Setup Prometheus Configuration #

#### Note: All the prometheus configurations should be present in /etc/prometheus/prometheus.yml file.

### Step 1: Create the prometheus.yml file.
```
sudo vi /etc/prometheus/prometheus.yml
```

### Step 2: Copy the following contents to the prometheus.yml file.
```
global:
  scrape_interval: 10s

scrape_configs:
  - job_name: 'prometheus'
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost:9090']
```

### Step 3: Change the ownership of the file to prometheus user.
```
sudo chown prometheus:prometheus /etc/prometheus/prometheus.yml
```


# III. Setup Prometheus Service File #

### Step 1: Create a prometheus service file.
```
sudo vi /etc/systemd/system/prometheus.service
```

### Step 2: Copy the following content to the file.
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

### Step 3: Reload the systemd service to register the prometheus service and start the prometheus service.
```
sudo systemctl daemon-reload
sudo systemctl start prometheus
```

### Step 4: Check the prometheus service status using the following command. The status should show the active state.
```
sudo systemctl status prometheus
```


# IV. Access Prometheus Web UI #

#### Note: Now you will be able to access the prometheus UI on 9090 port of the prometheus server.
```
http://<prometheus-ip>:9090/graph
```
### You should be able to see the following UI as shown below.
### You can use the prometheus query tab to query the available metrics as shown in the gig below.
### Right now, we have just configured the Prometheus server. You need to register the target in the prometheus.yml file to get the metrics from the source systems.
### For example, if you want to monitor ten servers, the IP address of these servers should be added as a target in the Prometheus configuration to scrape the metrics.
### The server should have Node Exporter installed to collect all the system metrics and make it available for Prometheus to scrap it.
### Follow this detailed Prometheus Node Exporter Guide (https://devopscube.com/monitor-linux-servers-prometheus-node-exporter/) to setup node exporter and registering it to the Prometheus server. 
### You can also use this setup as lab for the Prometheus Certified Associate (https://devopscube.com/prometheus-certified-associate/) Certification preparation.

### Source: https://devopscube.com/install-configure-prometheus-linux/

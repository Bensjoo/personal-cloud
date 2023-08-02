# My Personal Cloud
Referred to by me, as [*Vandelay Industries*](https://www.youtube.com/watch?v=Ugx06TlVyw4]), my home cloud is based around a kubernetes cluster running on Raspberry Pi microcomputers mixed with using some public cloud components and other SaaS products.

What I'm looking to accomplish with my homecloud
- Tinkering is fun!
- Personal data analytics infrastructure
- Try out OSS software in a low-stakes, fixed-cost environment
- Practical for hosting small dumb web app ideas that I tend to concieve

Repo will update as I add more components and features. Image belows shows the kubernetes cluster consisting of three nodes (1 orchestrator, 2x workers)
<p align="center">
    <img src="images/hardware.jpg" width="480"/>
</p>


## Architecture Overview
Right now Vandelay Industries contains:
- Kubernetes cluster
- single-machine VM
- Cloudflare zero-trust to manage access to hosted apps

<p align="center">
<img src="images/cluster-2023-08-02.png" width="1024"/>
</p>

## Experiments
Here I will list the experiments and features with links to specific


### Apache Airflow workflow scheduler setup
*To be written*
Running [Airflow](https://airflow.apache.org/) using NFS hosted on `art` as persistent storage for DAGs/Logs, and postgres on `bubbleboy` for airflow state management.

### Running BI using Apache Superset
*To be experimented, to be written*

This one is on my wishlist - It seems lately the containers are mostly ARM-compatible so best time ever to take a stab at it!

### Running public web app based on Flask/bootstrap 
*To be written*

Wrote an app to track statistics for a friend playing a game. Hosted on `vandelay-k8s` and publicly accessed through **Cloudflare Zero-trust** without opening any ports on my end.

### Setting up storage on cluster using Longhorn
*To be experimented, to be written*

my main goal is that persistent storage for my workloads on `vandelay-k8s` shou

### Setting up cluster monitoring
*To be concluded, to be written*

adding basic CPU/GPU statistics is nice, but also want to know more hardware related stuff like power usage, temperatures

## Kubernetes cluster Overview
*Full setup description to be written*

I've been playing around with running kubernetes on Pi for a long time, and was successful in setting up clusters already before Pi 4 came out. The fundamental problem was that I could never do the data projects that I wanted with the cluster due to limitations in available docker containers in ARM architecture, and also some limitations in the hardware (IOps mainly).

#### Hardware Setup
- All nodes: Raspberry Pi 4 Model B - 8GB RAM
- Master SSD:
  - Kingston *A400 SATA SSD 240GB* (found on sale)
  - Deltaco cabinet 2,5" SATA - USB 3.1
- Worker SSDs:
  - Kingston *NV2 M.2 NVMe Gen 4 1TB* (cheap on sale)
  - ASUS TUF NVMe SSD cabinet
  - usb c -> usb A cord (gen 3.1)
- Networking: 5-port Switch *D-LINK DGS-105* 
- Power: Linocell 50w brick (Just as I looked this up I found out that the manufacturer did a product recall due to fire hazard!)

The NVMe SSDs are total overkill for Pi but I found them really cheap on sale, in packaged deal with very robust and good-for-cooling cabinets.
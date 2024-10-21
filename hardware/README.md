
# Hardware Setup
My current inventory is as follows:

### Kubernetes cluster components
- All nodes: Raspberry Pi 4 Model B - 8GB RAM
- Master SSD:
  - Crucial *X8 SSD 500GB*
  - Sunguy USB type A -> type c gen 3.1
- Worker SSDs:
  - Kingston *NV2 M.2 NVMe Gen 4 1TB* (cheap on sale)
  - ASUS TUF NVMe SSD cabinet
  - Sunguy USB type A -> type c gen 3.1
- Networking: 5-port Switch *D-LINK DGS-105* 
- Power: Linocell 50w brick (Just as I looked this up I found out that the manufacturer did a product recall due to fire hazard!)

The NVMe SSDs are total overkill for Pi but I found them really cheap on sale, in packaged deal with very robust and good-for-cooling cabinets.

** Update on storages**

noticed that my storages might have been quite power-hungry, and combined with lots of IO running k8s stateful solutions it was leading to outages in the clusters. to be continued..

### Drive speeds
ran a benchmark outlined in [This benchmark](https://jamesachambers.com/2022-raspberry-pi-storage-benchmarks/) on raspberry pi
using diffrent storages. reference scores: nvmes seem to score ~18,000-20,0000. SD cards are much worse at ~2000

#### Crucial X8 500GB (usb c -> usb 3)
```Crucial
Category                  Test                      Result
HDParm                    Disk Read                 283.20 MB/sec
HDParm                    Cached Disk Read          211.69 MB/sec
DD                        Disk Write                198 MB/s
FIO                       4k random read            26189 IOPS (104757 KB/s)
FIO                       4k random write           17564 IOPS (70257 KB/s)
IOZone                    4k read                   41003 KB/s
IOZone                    4k write                  35173 KB/s
IOZone                    4k random read            26087 KB/s
IOZone                    4k random write           40929 KB/s

                          Score: 10729
```


#### ASUS TUF enclosed NVME
```
     Category                  Test                      Result
HDParm                    Disk Read                 243.04 MB/sec
HDParm                    Cached Disk Read          250.86 MB/sec
DD                        Disk Write                134 MB/s
FIO                       4k random read            11709 IOPS (46838 KB/s)
FIO                       4k random write           6677 IOPS (26710 KB/s)
IOZone                    4k read                   37040 KB/s
IOZone                    4k write                  34599 KB/s
IOZone                    4k random read            22168 KB/s
IOZone                    4k random write           40527 KB/s

                          Score: 8164
```

#### Crucial x9 1tb
```
     Category                  Test                      Result
HDParm                    Disk Read                 287.71 MB/sec
HDParm                    Cached Disk Read          277.64 MB/sec
DD                        Disk Write                175 MB/s
FIO                       4k random read            21026 IOPS (84106 KB/s)
FIO                       4k random write           17052 IOPS (68209 KB/s)
IOZone                    4k read                   13570 KB/s
IOZone                    4k write                  34082 KB/s
IOZone                    4k random read            23985 KB/s
IOZone                    4k random write           32140 KB/s

                          Score: 8988
```
## Kubernetes cluster Overview
*Full setup description to be written*

I've been playing around with running kubernetes on Pi for a long time, and was successful in setting up clusters already before Pi 4 came out. The fundamental problem was that I could never do the data projects that I wanted with the cluster due to limitations in available docker containers in ARM architecture, and also some limitations in the hardware (IOps mainly).


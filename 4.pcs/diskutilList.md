# $ diskutil list

/dev/disk0 (internal, physical):

\# | TYPE | NAME | SIZE | IDENTIFIER
---|---|---|---|---
0 | GUID_partition_scheme || 121.3 GB | disk0
1 | EFI EFI || 209.7 MB | disk0s1
2 | Apple_APFS Container disk2 || 81.1 GB | disk0s2
3 | Apple_APFS Container disk4 || 40.0 GB | disk0s3

/dev/disk1 (internal, physical):

\# | TYPE | NAME | SIZE | IDENTIFIER
---|---|---|---|---
0 | GUID_partition_scheme | | *1.0 TB | disk1
1 | EFI EFI | | 209.7 MB | disk1s1
2 | Apple_APFS Container | disk3 | 80.0 GB | disk1s2
3 | Apple_APFS Container | disk5 | 40.0 GB | disk1s3
4 | Apple_APFS Container | disk6 | 254.9 GB | disk1s4
5 | Apple_APFS Container | disk7 | 625.1 GB | disk1s5

/dev/disk2 (synthesized):

\# | TYPE | NAME | SIZE | IDENTIFIER
---|---|---|---|---
0 | APFS Container Scheme | - | +81.1 GB | disk2 Physical Store disk0s2
1 | APFS Volume | SSD - Datos | 57.5 GB | disk2s1
2 | APFS Volume | Preboot | 81.4 MB | disk2s2
3 | APFS Volume | Recovery | 528.9 MB | disk2s3
4 | APFS Volume | VM | 1.1 MB | disk2s4
5 | APFS Volume | SSD | 10.6 GB | disk2s5

/dev/disk3 (synthesized):

\# | TYPE | NAME | SIZE | IDENTIFIER
---|---|---|---|---
0 | APFS Container Scheme | - | +80.0 GB | disk3 Physical Store disk1s2
1 | APFS Volume | HD | 954.4 KB | disk3s1

/dev/disk4 (synthesized):

\# | TYPE | NAME | SIZE | IDENTIFIER
---|---|---|---|---
0 | APFS Container Scheme | - | +40.0 GB | disk4 Physical Store disk0s3
1 | APFS Volume | IN | 725.0 KB | disk4s1

/dev/disk5 (synthesized):

\# | TYPE | NAME | SIZE | IDENTIFIER
---|---|---|---|---
0 | APFS Container Scheme | - | +40.0 GB | disk5 Physical Store disk1s3
1 | APFS Volume | IN(HD) | 938.0 KB | disk5s1

/dev/disk6 (synthesized):

\# | TYPE | NAME | SIZE | IDENTIFIER
---|---|---|---|---
0 | APFS Container Scheme | - | +254.9 GB | disk6 Physical Store disk1s4
1 | APFS Volume | TM  | 987.1 KB | disk6s1

/dev/disk7 (synthesized):

\# | TYPE | NAME | SIZE | IDENTIFIER
---|---|---|---|---
0 | APFS Container Scheme | - | +625.1 GB | disk7 Physical Store disk1s5
1 | APFS Volume | LOG | 32.8 KB | disk7s1
2 | APFS Volume | TMP | 958.5 KB | disk7s2
3 | APFS Volume | DICOM | 958.5 KB | disk7s3
4 | APFS Volume | GITHUB | 958.5 KB | disk7s4
5 | APFS Volume | DOCKER | 958.5 KB | disk7s5

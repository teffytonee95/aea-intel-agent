# AEA INTEL AGENT

```
        ,        ,
       /(        )`
       \ \___   / |
       /- _  `-/  '
      (/\/ \ \   /\
      / /   | `    \
      O O   ) /    |
      `-^--'`<     '
     (_.)  _  )   /
      `.___/`    /
        `-----' /
<----.     __ / __   \
<----|====O)))==) \) /====
<----'    `--' `.__,' \
                 |        |
                  \       /
              ______( (_  / \______
            ,'  ,-----'   |        \
            `--{__________)        \/
```

AEA INTEL AGENT  
Command-line Threat Intelligence Fetcher  
© 2016 AEA Consultoría Informática — All Rights Reserved

---

## Overview

**AEA INTEL AGENT** is a lightweight command-line tool for fetching, normalizing, and reviewing threat-intelligence indicators from multiple public feeds.
Optimized for fast lookups, minimal dependencies, and terminal workflows.

---

## Features

- WHOIS / RDAP lookups (local `whois` fallback)
- Reputation aggregation (pluggable sources)
- Domain metadata
- Hash enrichment and type detection
- Local cache and feeds refresh
- Output formatted for SOC/SIEM ingestion
- Modular architecture under `modules/`

---

## Requirements

- Perl 5.16+
- Modules: `LWP::UserAgent`, `JSON`, `Getopt::Long`, `Digest::MD5` (optional)
- System: `whois` command (recommended fallback)

Install Perl modules (example):
```
cpan install LWP::UserAgent JSON Getopt::Long
```

---

## Quickstart

```bash
# make executable
chmod +x aea_intel_agent.pl

# IP lookup
./aea_intel_agent.pl --ip 8.8.8.8

# Domain lookup
./aea_intel_agent.pl --domain example.com

# Hash lookup
./aea_intel_agent.pl --hash d41d8cd98f00b204e9800998ecf8427e

# Refresh feeds
./aea_intel_agent.pl --update
```

---

## Directory Structure

```
aea-intel-agent/
├── aea_intel_agent.pl
├── modules/
│   ├── whois.pm
│   ├── rep_checker.pm
│   ├── domain_tools.pm
│   └── hashing.pm
├── feeds/
│   └── feeds.json
├── examples/
│   └── example_output.txt
├── LICENSE
├── README.md
├── .gitignore
└── SECURITY.md
```

---

## Feed Configuration

Feeds are defined in `feeds/feeds.json`. Example:

```json
{
  "otx": "https://otx.alienvault.com/api/v1/indicators/export",
  "blocklist_de": "https://www.blocklist.de/lists/all.txt",
  "abuseipdb": "https://api.abuseipdb.com/api/v2/check?ipAddress={ip}"
}
```

---

## CONTRIBUTING

Contributions accepted via pull requests. For security-sensitive issues, see `SECURITY.md`.

---

## License

This project is distributed under a **custom proprietary license**. See `LICENSE`.

**© 2016 AEA Consultoría Informática — All Rights Reserved**

---

## Author

Antonela Estefanía Arenas — AEA Consultoría Informática
https://aeaconsultoria.com.ar

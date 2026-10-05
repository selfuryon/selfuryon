---
title: Sergei Iakovlev
headline: Principal SRE — Ethereum staking infrastructure and platform engineering
description: >-
  Principal SRE and tech lead of P2P.org's Ethereum unit: 32,000+ mainnet
  validators on bare-metal Kubernetes, platform and security standards, 15
  years in infrastructure.
lang: en
contacts:
  - "[selfuryon@pm.me](mailto:selfuryon@pm.me)"
  - "[github.com/selfuryon](https://github.com/selfuryon)"
  - "[linkedin.com/in/sergei-iakovlev](https://www.linkedin.com/in/sergei-iakovlev/)"
  # the phone is left out on purpose (the site is public)
  - Paphos, Cyprus · Remote
# Variants (see variant.lua): "sre" is the main page, "platform" is served at
# /platform/ and not linked from anywhere. Fields here override the top level.
variants:
  platform:
    headline: Principal Engineer — platform engineering, DevSecOps and SRE leadership
    description: >-
      Principal engineer and tech lead: built a bare-metal Kubernetes platform
      used by every team, cut infrastructure cost by 70%+, sets platform and
      security standards.
    noindex: true
---

<!--
  Variants: wrap variant-only content in ::: {.only-sre} / ::: {.only-platform}
  (or [..]{.only-sre} inline). Unmarked content goes into both.

  Layout conventions (see style.css):
    ## Section
    ### [Role · [Company](url)]{.role} [Dates]{.when}
    [One line of company context · Location]{.about}
    - Bullet text. Bold only in role lines; no other emphasis.
  Skills are a pandoc definition list ("Term" line, then ": items").
  HTML comments like this one are stripped from the output.

  Figures for P2P.org come from the validator inventory as of 2026-10-05:
  32,444 active mainnet validators (17,037 Vouch/Dirk + 15,407 SSV),
  1.17M ETH effective balance, 63 EL/CL node pairs, 5 EL + 4 CL clients
  (largest share: Prysm 20/63 nodes), 4 EU regions, 66 SSV operator nodes.
-->

## Summary

::: {.only-sre}
Principal SRE and tech lead of the Ethereum unit at P2P.org. Responsible for the reliability of 32,000+ mainnet validators
(1.1M+ ETH) on bare-metal Kubernetes: 99.998% attestation participation, zero
slashing on threshold-signed validators, #1 Lido operator by
performance on Rated Network. Managed a team of up to four SREs as SRE manager in
2024–2026. 15 years in infrastructure:
data-center networks first, Kubernetes platforms since 2019.
:::

::: {.only-platform}
Principal engineer and tech lead at P2P.org. Launched the company's first
bare-metal Kubernetes cluster and grew it into the internal platform every team
runs on, cutting infrastructure cost by more than 70%. Set the platform and
security standards across teams, lead DevSecOps, and run a fleet of 32,000+
Ethereum validators on top of it. Managed a team of up to four engineers as
SRE manager in 2024–2026. 15 years in infrastructure: data-center networks first, Kubernetes
platforms since 2019.
:::

## Experience

<!-- P2P.org titles and dates from HR records (HiBob): DevOps Engineer 2021-07-15,
     Senior SRE Manager 2024-06-01, Principal SRE Manager 2025-10-01,
     Principal SRE Engineer 2026-02-02 (ETH Ecosystem). -->

### [Principal SRE Engineer, Tech Lead · [P2P.org](https://p2p.org)]{.role} [2026-02 – now]{.when}

[Non-custodial staking provider, #1 Lido operator by performance on Rated Network · Remote]{.about}

Tech lead of the Ethereum unit: reliability, security and technical direction.

<!-- Platform variant leads with standards and DevSecOps; the same two bullets
     sit in the only-sre block below. Edit both copies. -->
::: {.only-platform}
- Own the Kubernetes reference architecture and security baseline used across
  all teams, agreed through RFCs; act as the technology advisor and technical
  interviewer for every engineering team.
- Lead DevSecOps practice: keyless cosign signatures and SLSA provenance for
  every image, binary and deployment artifact; SHA-pinned, audited CI
  workflows; reproducible builds with Nix.
:::

- Own the reliability of 32,000+ active mainnet validators (1.1M+ ETH) with
  zero slashing on threshold-signed validators: Vouch with 2-of-3 Dirk
  signing, distributed validators on SSV and Obol, 63 node pairs across four
  European regions.
- Keep the fleet at the top of the field: 99.998% attestation participation
  and 99.57% correct head votes against 98.7% for the network (Jul–Oct 2026).
  On Rated Network as of October 2026: #1 Lido operator over 7 and 30 days,
  #1 of all operators network-wide over 30 days and #3 over 7 days.
  <!-- Rated Network ranks as of 2026-10-06 (from Sergei); refresh before sending.
       Participation/head: canonical_beacon_attestation_reward, 2026-06-30..2026-10-04,
       kleido scope without mixed SSV clusters (~31.3k keys). Only 97 days of data.
       Compare against Lido curated operators first: the network average
       includes offline keys. -->

::: {.only-sre}
- Run five execution and four consensus clients in many different pairings,
  so a single client bug cannot take the fleet down.
- Own the Kubernetes reference architecture and security baseline used across
  all teams, agreed through RFCs; act as the technology advisor and technical
  interviewer for every engineering team.
- Lead DevSecOps practice: keyless cosign signatures and SLSA provenance for
  every image, binary and deployment artifact; SHA-pinned, audited CI
  workflows; reproducible builds with Nix.
:::
- Write the unit's services in Rust: validator inventory, exits via threshold
  BLS and Safe role policies, Lido reward claims with safety checks.
- Built network analytics on Xatu, Kafka and ClickHouse, and exposed it and
  Grafana to LLM agents over MCP, now used company-wide.

### [SRE Manager (Senior → Principal) · P2P.org]{.role} [2024-06 – 2026-02]{.when}

Led the Ethereum SRE team of up to four engineers, staying hands-on.

- Ran the team: hiring, 1:1s, growth plans and performance reviews.
- Organised on-call and incident management for the unit: rotations,
  escalation, P1–P5 severities by network; ran blameless postmortems with
  tracked action items.

::: {.only-sre}
- Built the reliability model: about 60 alert rules with severity by network,
  missed-duty detection from ClickHouse, daily reports on attestation
  correctness (rated.network methodology) and APR against Lido peers.
:::


### [DevOps Engineer · P2P.org]{.role} [2021-07 – 2024-06]{.when}

Moved the Ethereum infrastructure off cloud VMs onto company-owned bare metal.

- Launched the company's first bare-metal Kubernetes cluster and grew it into
  the internal platform used by every team. Moving workloads off cloud VMs
  cut infrastructure cost by more than 70%.
- Designed the delivery model for Ethereum workloads: CUE and Nix, Crossplane
  and Terraform on bare metal and three clouds, ArgoCD from OCI.

::: {.only-sre}
- Designed disaster recovery for signing: 2-of-3 Dirk threshold across three
  regions with slashing-protection databases, and wallet stores replicated to
  versioned, KMS-encrypted object storage in a separate cloud.
:::

### [Senior DevOps Engineer · SoftPro]{.role} [2019-09 – 2021-07]{.when}

<!-- TODO: one line on what Softpro does -->
[Software company · Moscow, Russia]{.about}

- Led the move from VMs with apt packages and docker-compose to bare-metal
  Kubernetes: 7+ clusters of about 30 nodes across several data centers.
- Introduced infrastructure as code, CI/CD and observability as standard
  practice, wrote internal Terraform providers; cut deploy time from 40
  minutes to 4.

### [Network Architect, Team Lead · HOST]{.role} [2011-04 – 2019-09]{.when}

<!-- TODO: one line on what HOST does (system integrator?) -->
[IT integrator · Perm, Russia · Network Engineer (2011) → Senior (2014) → Architect, Team Lead (2017)]{.about}

- Led the network engineering group: staffing across projects, workload
  planning, training; owned pre-sales for the group, including its budget.
- Designed multi-DC infrastructure for a bank (150+ servers, 1,000+ VMs) and
  replaced two data centers' network for Russia's largest reseller with no
  maintenance window over one hour.

## Skills

Ethereum
: [Geth, Nethermind, Besu, Reth, Lighthouse, Prysm, Teku, Nimbus; Vouch,
  Dirk, SSV, Obol; commit-boost (MEV-Boost); Lido, StakeWise]{.only-sre}[Validator
  infrastructure: execution and consensus clients, threshold signing,
  distributed validators, MEV; Lido, StakeWise]{.only-platform}

Platform
: Kubernetes on bare metal and in the cloud, Talos, Cilium, ArgoCD

IaC
: Nix, CUE, Terraform, Crossplane

Observability
: Prometheus, VictoriaMetrics, Grafana, Loki, Tempo, OpenTelemetry,
  Alertmanager

Data
: ClickHouse, Kafka, PostgreSQL

Security
: HCP Vault, SLSA, Tailscale, CI hardening

Programming
: Rust, Go, Python

## Education

### [Computer Security, 5.5-year specialist degree · Perm State University]{.role} [2006 – 2012]{.when}

[Faculty of Mechanics and Mathematics · Perm, Russia]{.about}

## Other

<!-- GitHub figures as of 2026-10-06 (gh search, author/reviewed-by selfuryon).
     Work: org:p2p-org, 2025-10-06..2026-10-06 — 944 PRs authored, 916 merged,
     21 repos, 1,798 PRs reviewed (may include bot PRs), ~1,660 commits.
     Open source: public repos outside selfuryon/*, all time since 2018 —
     154 PRs, 134 merged, 22 projects, 343 PRs reviewed. -->
At work
: 900+ merged PRs in 21 repositories and ~1,800 reviews over the last year

Open source
: Maintainer of [ethereum.nix](https://github.com/nix-community/ethereum.nix);
  130+ merged PRs to 22 projects since 2018 (Lighthouse, Dirk, Commit-Boost,
  Lido, nixpkgs); author of [dkc](https://github.com/p2p-org/dkc) and
  [netdev](https://github.com/selfuryon/netdev)

Certifications
: CKA (2021); Cisco CCSP, Check Point CCSE, Palo Alto ACE, Huawei HCNA

Languages
: Russian (native), English (professional working proficiency)

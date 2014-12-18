# Measuring Peerflix Performance

Scripts for setting up a BitTorrent network for measurements on Peerflix.

## Introduction

With this experiment, we want to measure the performance of Peerflix. Peerflix is an application for streaming movies from BitTorrent and is being used by (some versions of) PopcornTime. We want to measure the relationship between the number of available nodes and the performance of Peerflix.

The experiment is executed for the course Measuring and Simulating the Internet (MASTI) of the TU Delft. The team consists of Erik Lemmens, Rendong Liu, Pim Veldhuisen, Johnny Verhoeff and Rick Wieman.

## Setup

This repository contains scripts for launching a Vagrant environment. However, we want to run the actual experiment on PlanetLab (for a more realistic setup in terms of global distribution and network delays).

### Provisioning

The scripts in the `provision` folder should always be run on the corresponding node(s) first. The Tracker requires a webserver setup and requires no further interaction after provisioning. For seeders and peerflixers, the provisioning scripts only do some installation work. Note that it can do no harm to run provisioning scripts on already provisioned systems.

### Measurements

The `measurements` folder contains shell scripts that execute a certain measurement. For now, those are starting delay and skipping delay.

#### Delays

By mimicking a VLC call to peerflix, we can easily determine the delay for getting a certain part of the movie. If we take a realistic buffer size as the total size of the requested part, this should give a good impression how long it would take before (for example VLC) would continue playing.

### Running the experiment

For the Vagrant environment, `start.sh` contains all code to initiate the seeder(s) and peerflix(ers). It boils down to deploying the torrent(s) to the seeder(s) and launching peerflix with the torrent(s) on the peerflixers. Afterwards, it executes the measurements on the Peerflix nodes.
# Setup for multiple instances

This document provides the general idea of running this distributed experiment. It's especially useful when porting the experiment to PlanetLab.

## Tracker node

Boot a fresh tracker node. Run the provisioning script as root and make a note of the IP address. This node can now be used as a BitTorrent tracker.

## Torrent

Create a torrent for your _streamable_ movie using your favorite torrent client. Use the tracker URL of the node created above.

## Seeders

Boot fresh seeder nodes, and using a list of IPs:

- Upload the provisioning script
- Upload the movie and the corresponding torrent
- Run the provisioning script as root
- Launch deluge with the torrent, specifying the path where the video file is
- Deluge should be seeding your video now. You could verify this using your torrent client and the torrent file

## Peerflixers

Boot fresh Peerflix nodes, and using a list of IPs:

- Upload the provisioning script
- Upload the torrent
- Run the provisioning script as root
- Launch `peerflix your_movie.torrent`

On the Peerflix nodes, we can now run the measurements from the `measurements` directory. Afterwards, we also need to collect those results.
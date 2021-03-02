# PuTTY-to-WSL
Scripts to use PuTTY to ssh from Windows 10 into any number of installed distributions of WSL and WSL2

I wrote this to solve the problem of wanting to use PuTTY as my terminal of choice of installed WSL distributions.

One of the issues is that WSL2 launches with a different IP address each time. Some articles on the Internet recommend an elaborate method of port forwarding on Windows. I think my solution is a bit simpler, although perhaps limited to puTTY.

It relies on launching WSL, getting the IP address with `ifconfig eth0 | grep 'inet\ ' | head -1 | awk '{print $2}'` (on Ubuntu) and then using that address to ssh into the instance.

The first script *Start-WSL.cmd* is a Windows cmd script that takes the WSL distribution name as an argument (for example "Ubuntu-18.04"), calls that WSL with *run-ssh.sh*, gets back the IP address returned by *run-ssh.sh*, and passes that to PuTTY. Note that in my example, I have a preconfigured PuTTY session called "Win10 Ubuntu". All that contains is display settings, so feel free to omit it or use your own.

The second script *run-ssh.sh* is run on the distribution. It makes sure ssh is running, and returns the IP address. My *run-ssh.sh* is configured for Ubuntu.

To make a clickable link on Windows 10, I create shortcusts to *Start-WSL.cmd* with different arguments for each distribution.

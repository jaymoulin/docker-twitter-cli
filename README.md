![logo](logo.png)

Docker Image (Multiarch) - Twitter CLI Client
=============================================

[![latest release](https://img.shields.io/github/release/jaymoulin/docker-twitter-cli.svg "latest release")](http://github.com/jaymoulin/docker-twitter-cli/releases)
[![Docker Pulls](https://img.shields.io/docker/pulls/jaymoulin/twitter-cli.svg)](https://hub.docker.com/r/jaymoulin/twitter-cli/)
[![Docker Stars](https://img.shields.io/docker/stars/jaymoulin/twitter-cli.svg)](https://hub.docker.com/r/jaymoulin/twitter-cli/)
[![PayPal donation](https://github.com/jaymoulin/jaymoulin.github.io/raw/master/ppl.png "PayPal donation")](https://www.paypal.me/jaymoulin)
[![Buy me a coffee](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png "Buy me a coffee")](https://www.buymeacoffee.com/3Yu8ajd7W)
[![Become a Patron](https://badgen.net/badge/become/a%20patron/F96854 "Become a Patron")](https://patreon.com/jaymoulin)


THIS REPOSITORY IS AUTO-UPDATED BY [GITHUB-RELEASE-NOTIFIER](https://github.com/femtopixel/github-release-notifier) (https://github.com/femtopixel/github-release-notifier)

This program allows you to use Twitter in CLI through Docker technology

This work is based upon [Sferik's T (Twitter CLI client)](https://github.com/sferik/t).

Submitting bugs and feature requests
------------------------------------

Bugs and feature request are tracked on GitHub [Issues](https://github.com/jaymoulin/docker-twitter-cli)

Configuration
-------------

First, you need to authenticate to twitter with the following command: 

```
docker run -ti --rm -v /path/to/authkey/folder:/root jaymoulin/twitter-cli authorize
```

Then, follow the displayed instructions.

When done, you should be able to execute [Sferik's T (Twitter CLI client)](https://github.com/sferik/t) commands following this pattern:


```
docker run -ti --rm -v /path/to/authkey/folder:/root jaymoulin/twitter-cli <command>

```

For example:

```
docker run -ti --rm -v ~/.trc:/root/.trc jaymoulin/twitter-cli whois moulinjay
```

Should give you something like :

```
Screen name  @MoulinJay
Name         Jay MOULIN
Tweets       41
Favorites    15
Listed       1
Following    188
Followers    28
Bio          Tech addict - Tech Lead - #PHP/#Docker/#DevOps/#RaspberryPi https://t.co/mCz8IsZKVh / https://t.co/4eCuM0F00W . Also Lead Vocalist at AANOD
Location     Paris, France
URL          http://jaymoulin.github.io
```

Appendixes
---

### Install Docker

If you don't have Docker installed yet, you can do it easily in one line using this command
 
```
curl -sSL "https://gist.githubusercontent.com/jaymoulin/e749a189511cd965f45919f2f99e45f3/raw/0e650b38fde684c4ac534b254099d6d5543375f1/ARM%2520(Raspberry%2520PI)%2520Docker%2520Install" | sudo sh && sudo usermod -aG docker $USER
```

Author
------

Jay MOULIN jaymoulin@gmail.com See also the list of contributors which participated in this program.

License
-------

This Docker image is licensed under the MIT License

# High Traffic wordpress server configuration
> This LEMP stack is that fastest way to start running WordPress on your server. Using Nginx, PHP 7.4, Mariadb.

![](wordpress.jpg)

## Installation & Usage

## (1st Step) CloudFlare settings

Add your droplet(vps) ip address to CloudFlare A record.

![](cf.png)

## (2nd Step) Login to ssh console

run below script. it'll ask your domain name just add "yoursite.com" format next your database name add "examplewp"

![](tr.png)

###### Ubuntu-18.04 and Ubuntu-20.04 Support.

Linux Only:

```sh
wget -qO htw run.kloudboy.com/htw && sudo bash htw
```

## Features

> Nginx (Lastest)

> PHP 8.2

> PHP-fpm

> Mariadb (Lastest)

> Wordpress (Lastest)

> WP-CLI (Lastest)

> Memcached (Lastest)

> Cloudflare Full SSL

## Activate Memcached

>Install W3 Total Cache and Activate

In the main menu, go to Performance then click on General Settings
###### Activate Memcached for the following options:

Page Cache Method
![](pg.png)

Database cache method
![](db.png)

Save the settings

## KloudBoy Recommended Plugins to Get Google / GTmatrix 100% Pagespeed.

1. reSmush.it
The FREE Image Optimizer which will compress your pictures and improve your SEO & performances…
[Install Now](https://wordpress.org/plugins/resmushit-image-optimizer/)

2. WP Cloudflare Super Page Cache
Speed up a WordPress website by caching your webpages onto global CDN using any Cloudflare
[Install Now](https://wordpress.org/plugins/wp-cloudflare-page-cache/)

## Gtmetrix Performance Report

![](wp.png)

## Try DigitalOcean for Free with a $100 Credit

![](of.gif)

Offer Link:- https://offer.kloudboy.com/100USD-credit-coupon

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## Author

Bajpan Gosh – [@bajpangosh](https://twitter.com/bajpangosh) – bajpan@kloudboy.com


## NEED HELP?

We are a team of dedicated Cloud Server Administrators assures 24/7 availability of experts for all levels of your server management requirements.

I'd be glad to help you if you have any questions relating to this script. No guarantees, but I'll do my best to assist.

Support via Facebook, Twitter, Email, Ticket

email    :-support@kloudboy.com

facebook :- https://m.me/TeamKloudBoy

twitter  :- https://twitter.com/TeamKloudBoy

ticket   :-https://kloudboy.freshdesk.com/support/home

Made By <3 https://www.kloudboy.com/


<a href="https://www.digitalocean.com/?refcode=9da6beb25893&utm_campaign=Referral_Invite&utm_medium=Referral_Program&utm_source=badge"><img src="https://web-platforms.sfo2.cdn.digitaloceanspaces.com/WWW/Badge%201.svg" alt="DigitalOcean Referral Badge" /></a>

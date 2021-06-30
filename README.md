## Letsencrypt with Netcup API

Request a valid letsencrypt certificate and store it in a docker container for later usage. Create `account.conf` file and store your Netcup API key, password, customer id and Mail.

```
ACCOUNT_EMAIL='webmaster@example.com'
SAVED_NC_Apikey='netcup_api_key'
SAVED_NC_Apipw='netcup_api_password'
SAVED_NC_CID='netcup_customer_id'
```

Modify the `DOMAIN_NAME` variable

```
$ docker build --build-arg DOMAIN_NAME=example.com -t netcup_letsencrypt:latest .
```

* Your cert is in /root/.acme.sh/example.com/example.com.cer
* Your cert key is in /root/.acme.sh/example.com/example.com.key
* The intermediate CA cert is in /root/.acme.sh/example.com/ca.cer
* The full chain certs is there: /root/.acme.sh/example.com/fullchain.cer

Access container and check certificates  
```
$ docker run --rm netcup_letsencrypt ls -la /root/.acme.sh/example.com
```

Copy certs to docker host
```
$ mkdir certs
$ docker cp <containerId>:/root/.acme.sh/example.com/ certs/
```

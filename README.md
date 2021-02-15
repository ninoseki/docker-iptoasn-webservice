# docker-iptoasn-webservice

Unofficial Docker image of [iptoasn-webservice](https://github.com/jedisct1/iptoasn-webservice).

## Usage

```bash
docker run -itd --name my-iptoasn -p 80:53661 ninoseki/iptoasn

curl 127.0.0.1:80/v1/as/ip/8.8.8.8
```

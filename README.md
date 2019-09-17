# adrtest

Testing ADR Integration

# How to build

Just create a docker image with:

```
docker build -t adrtest .
```

# How to run

Create a .env file with:

```
JAVA_OPTS=-DJWT_SECRET=mysecret -DJWT_CLIENT=myclient
```
The run:

```
docker run --rm -it -p 8080:8080 --env-file=.env adrtest
```

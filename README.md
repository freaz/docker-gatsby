# docker-gatsby

Docker Image to develop and server [Gatsby](https://www.gatsbyjs.org/) sites.

## Usage

To setup your Gatsby project using this Docker image you need to create:

1. **Dockerfile**
    ```dockerfile
    FROM freaz/gatsby:latest
    ```
2. **docker-compose.yaml** - meant for running app on prduction
    ```yaml
    version: '3'
    services:
      web:
        build: .
      ports:
        - 80:80
    ```
3. **develop.yaml** - for local development
    ```yaml
    version: '3'
    services:
      web:
        command: develop --host 0.0.0.0 --port 80
        volumes:
          - .:/www
    ```

Then running application ready for production with:

```bash
$ docker-compose up
```

and for development with:

```bash
$ docker-compose -f docker-compose.yaml -f develop.yaml up
```

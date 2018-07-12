## Installation 

Follow below directions to install this container:

1. Clone the repository
2. Run `docker build . -t mat-tempdb`

### Testing

1. Run with:
	`docker run -it --rm \
		--publish 3306:3306 \
		ma-dbtest`

2. Test with: `mysql -h 127.0.0.1 -P 3306 -u root -p`

3. Get into the component with: `docker exec -i -t [CONTAINER ID] /bin/bash`

## Troubles?

Get in touch [netzahdzc@cicese.mx (mailto:netzahdzc@cicese.mx)
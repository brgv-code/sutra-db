dev-setup:
	gel project init
dev-migrate: 
	gel migration create
	gel migration apply

test-migrate:
	gel --credentials-file credentials/testing.json migration apply

prod-migrate:
	gel --credentials-file credentials/production.json migration apply

test-start:
	docker compose -f docker/docker-compose.testing.yml up -d

prod-start:
	docker compose -f docker/docker-compose.production.yml up -d

test-stop:
	docker compose -f docker/docker-compose.testing.yml down


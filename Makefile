DB_USER := postgres
DB_PASSWORD := postgres
DB_NAME := newsletter
DB_PORT := 5432

write-env-var:
	@export DATABASE_URL="postgres://$(DB_USER):$(DB_PASSWORD)@localhost:$(DB_PORT)/$(DB_NAME)"




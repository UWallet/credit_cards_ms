docker-compose build
docker-compose run --rm credit-cards-ms rails db:create
docker-compose run --rm credit-cards-ms rails db:migrate
docker-compose up

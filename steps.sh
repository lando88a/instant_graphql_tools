case "$1" in
"1")
    echo '________________________________________
Step 1:

Run PostgreSQL container:
  - docker run -d --rm -v $PWD/postgres_db_sample/dump:/docker-entrypoint-initdb.d --net="host" --name postgres -e POSTGRES_PASSWORD=postgres postgres
'
    echo 'docker run -d --rm -v $PWD/postgres_db_sample/dump:/docker-entrypoint-initdb.d --net="host" --name postgres -e POSTGRES_PASSWORD=postgres postgres' | xclip -sel clip
    ;;
"2")
    echo '________________________________________
Step 2:

Connect to PostgreSQL:
  - docker exec -it postgres psql postgres postgres
'
    echo 'docker exec -it postgres psql postgres postgres' | xclip -sel clip
    ;;
"3")
    echo '________________________________________
Step 3:

Run NodeJS container:
  - docker run -it --rm --net="host" --name postgraphile node bash
'
    echo 'docker run -it --rm --net="host" --name postgraphile node bash' | xclip -sel clip
    ;;
"4")
    echo '________________________________________
Step 4:

Install postgraphile dependency:
  - npm install -g postgraphile
'
    echo 'npm install -g postgraphile' | xclip -sel clip
    ;;
"5")
    echo '________________________________________
Step 5:

Excecute postgraphile as service:
  - postgraphile -w -o -c "postgres://postgres:postgres@localhost:5432/postgres"
'
    echo 'postgraphile -w -o -c "postgres://postgres:postgres@localhost:5432/postgres"' | xclip -sel clip
    ;;
"6")
    echo '________________________________________
Step 6:

Open GraphiQL:
  http://localhost:5000/graphiql

Open Apollo Studio Sandbox:
  https://studio.apollographql.com/sandbox/explorer/

Configure the service URL at the top-left corner as following:
  http://localhost:5000/graphql
'
    echo 'http://localhost:5000/graphql' | xclip -sel clip
    ;;
"7")
    echo '________________________________________
Step 7:

Run Hasura container:
  - docker run -it --rm --net="host" -e HASURA_GRAPHQL_ENABLE_CONSOLE=true -e HASURA_GRAPHQL_DATABASE_URL="postgres://postgres:postgres@localhost:5432/postgres" --name hasura hasura/graphql-engine
'
    echo 'docker run -it --rm --net="host" -e HASURA_GRAPHQL_ENABLE_CONSOLE=true -e HASURA_GRAPHQL_DATABASE_URL="postgres://postgres:postgres@localhost:5432/postgres" --name hasura hasura/graphql-engine' | xclip -sel clip
    ;;
"8")
    echo '________________________________________
Step 8:

Open Hasura Console:
  http://localhost:8080/console

Open Apollo Studio Sandbox:
  https://studio.apollographql.com/sandbox/explorer/

Configure the service URL at the top-left corner as following:
  http://localhost:8080/v1/graphql
'
    echo 'http://localhost:8080/v1/graphql' | xclip -sel clip
    ;;
"9")
    echo '________________________________________
Step 9:

Customizing Logic:

    CREATE VIEW store_films_count_view AS
    SELECT count(1), store_id
    FROM inventory
    GROUP BY store_id;

    CREATE FUNCTION store_films_count_function(store_id int) RETURNS int AS $$
      SELECT count(1)
      FROM inventory
      WHERE inventory.store_id = store_films_count_function.store_id
    $$ LANGUAGE sql STABLE;

    CREATE FUNCTION customer_full_name(c customer) RETURNS text AS $$
      SELECT c.first_name || '\'' '\'' || c.last_name
    $$ LANGUAGE sql STABLE;

    CREATE FUNCTION rent_a_film(inventory_id int, customer_id int, staff_id int) RETURNS int AS $$
      INSERT INTO rental VALUES (
        DEFAULT,
        now(),
        inventory_id,
        customer_id,
        NULL,
        staff_id,
        DEFAULT
      )
      RETURNING rental_id;
    $$ LANGUAGE sql VOLATILE;
'
    echo 'CREATE VIEW store_films_count_view AS
SELECT count(1), store_id
FROM inventory
GROUP BY store_id;

CREATE FUNCTION store_films_count_function(store_id int) RETURNS int AS $$
  SELECT count(1)
  FROM inventory
  WHERE inventory.store_id = store_films_count_function.store_id
$$ LANGUAGE sql STABLE;

CREATE FUNCTION customer_full_name(c customer) RETURNS text AS $$
  SELECT c.first_name || '\'' '\'' || c.last_name
$$ LANGUAGE sql STABLE;

CREATE FUNCTION rent_a_film(inventory_id int, customer_id int, staff_id int) RETURNS int AS $$
  INSERT INTO rental VALUES (
    DEFAULT,
    now(),
    inventory_id,
    customer_id,
    NULL,
    staff_id,
    DEFAULT
  )
  RETURNING rental_id;
$$ LANGUAGE sql VOLATILE;' | xclip -sel clip
    ;;
"10")
    echo '________________________________________
Step 10:

Postgraphile customization by Smart Comments:

    COMMENT ON TABLE customer IS E'\''@name buyer'\'';
    COMMENT ON COLUMN rental.rental_date IS E'\''@name controlled_rental_date'\'';
    COMMENT ON TABLE rental IS E'\''@name controlled_rental\n@omit insert,update,delete'\'';
    COMMENT ON VIEW store_films_count_view IS E'\''@foreignKey (store_id) references store (store_id)'\'';
    COMMENT ON TABLE actor IS E'\''@omit'\'';
'
    echo 'COMMENT ON TABLE customer IS E'\''@name buyer'\'';
COMMENT ON COLUMN rental.rental_date IS E'\''@name controlled_rental_date'\'';
COMMENT ON TABLE rental IS E'\''@name controlled_rental\n@omit insert,update,delete'\'';
COMMENT ON VIEW store_films_count_view IS E'\''@foreignKey (store_id) references store (store_id)'\'';
COMMENT ON TABLE actor IS E'\''@omit'\'';' | xclip -sel clip
    ;;
"11")
    echo '________________________________________
Step 11:

Run http server:
  - python3 -m http.server -d hasura/
'
    echo 'python3 -m http.server -d hasura/' | xclip -sel clip
    ;;
"12")
    echo '________________________________________
Step 12:

Open json file in the browser using GET:
  - http://localhost:8000/sample.json
'
    ;;
"13")
    echo '________________________________________
Step 13:

Hasura customization by Actions:

    type SampleOutput {
      name: String!
      age: Int!
      car: String!
    }
'
    echo 'type SampleOutput {
  name: String!
  age: Int!
  car: String!
}' | xclip -sel clip
    ;;
"14")
    echo '________________________________________
Step 14:

Stop Postgres, Postgraphile and Hasura:
  - docker stop hasura postgraphile postgres
'
    echo 'docker stop hasura postgraphile postgres' | xclip -sel clip
    ;;
"15")
    echo '________________________________________
Step 15:

Run Dgraph container:

  - docker run -it --rm --net="host" --name dgraph dgraph/standalone:v21.03.0
'
    echo 'docker run -it --rm --net="host" --name dgraph dgraph/standalone:v21.03.0' | xclip -sel clip
    ;;
"16")
    echo '________________________________________
Step 16:

Open Ratel: http://localhost:8000
'
    ;;
"17")
    echo '________________________________________
Step 17:

Set schema:
  - curl -X POST localhost:8080/admin/schema --data-binary "@dgraph/schema.graphql"
'
    echo 'curl -X POST localhost:8080/admin/schema --data-binary "@dgraph/schema.graphql"' | xclip -sel clip
    ;;
"18")
    echo '________________________________________
Step 18:

Open Apollo Studio Sandbox:
  https://studio.apollographql.com/sandbox/explorer/

Configure the service URL at the top-left corner as following:
  http://localhost:8080/graphql
'
    echo 'http://localhost:8080/graphql' | xclip -sel clip
    ;;
"19")
    echo '________________________________________
Step 19:

Run GoLang container:
  - docker run -it --rm --net="host" golang bash
'
    echo 'docker run -it --rm --net="host" golang bash' | xclip -sel clip
    ;;
"20")
    echo '________________________________________
Step 20:

Init golang project:
  - mkdir dgraph-client && cd dgraph-client && go mod init github.com/lando88a/dgraph-client
'
    echo 'mkdir dgraph-client && cd dgraph-client && go mod init github.com/lando88a/dgraph-client' | xclip -sel clip
    ;;
"21")
    echo '________________________________________
Step 21:

Install gRPC Dgraph client:
  - go get -u -v github.com/dgraph-io/dgo/v210
'
    echo 'go get -u -v github.com/dgraph-io/dgo/v210' | xclip -sel clip
    ;;
"22")
    echo '________________________________________
Set code to run gRPC Dgraph client:

    package main

    import (
      "context"
      "fmt"

      "github.com/dgraph-io/dgo/v210"
      "github.com/dgraph-io/dgo/v210/protos/api"
      "google.golang.org/grpc"
    )

    func main() {
      d, _ := grpc.Dial("localhost:9080", grpc.WithInsecure())
      dgraphClient := dgo.NewDgraphClient(
        api.NewDgraphClient(d),
      )
      txn := dgraphClient.NewTxn()
      ctx := context.Background()
      defer txn.Discard(ctx)

      const q = `
        {
          all(func: has(<dgraph.type>)) @filter(eq(<dgraph.type>, "Customer")) {
            Customer.name
          }
        }
      `
      resp, _ := txn.Query(ctx, q)
      fmt.Println(string(resp.GetJson()))
    }
'
    echo 'echo '\''package main

import (
  "context"
  "fmt"

  "github.com/dgraph-io/dgo/v210"
  "github.com/dgraph-io/dgo/v210/protos/api"
  "google.golang.org/grpc"
)

func main() {
  d, _ := grpc.Dial("localhost:9080", grpc.WithInsecure())
  dgraphClient := dgo.NewDgraphClient(
    api.NewDgraphClient(d),
  )
  txn := dgraphClient.NewTxn()
  ctx := context.Background()
  defer txn.Discard(ctx)

  const q = `
    {
      all(func: has(<dgraph.type>)) @filter(eq(<dgraph.type>, "Customer")) {
        Customer.username
      }
    }
  `
  resp, _ := txn.Query(ctx, q)
  fmt.Println(string(resp.GetJson()))
}'\'' > main.go' | xclip -sel clip
    ;;
"23")
    echo '________________________________________
Step 23:

Run code:
  - go run main.go
'
    echo 'go run main.go' | xclip -sel clip
    ;;
*)
    echo '________________________________________
This is a help tool to list all steps to be applied

  Run again this tool using the step number (between 1 and 23) as parameter:
    - ./steps.sh 1
    - ./steps.sh 2
         ...
    - ./steps.sh 23
'
    ;;
esac

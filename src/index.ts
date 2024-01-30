import { createClient } from "@libsql/client";

const client = createClient({
  url: "file:./infrastructure/database/BBDD.db",
  // authToken: "",
});

// const result = await
client
  .execute(/*html*/ `select * from table `)
  .then((result) => console.log(result));

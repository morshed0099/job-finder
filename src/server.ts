import app from "./app";
import { Server } from "http";

const port = 3000;

app.get("/", (req, res) => {
  res.send(`server is running on ${port}`);
});

async function main() {
  const server: Server = app.listen(port, () =>
    console.log(`server is running on ${port}`)
  );
}
main();

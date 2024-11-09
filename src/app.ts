import express, { Application, Request, Response, urlencoded } from "express";
import cors from "cors";
import router from "./router";
import globalError from "./shared/globalError";
import notFound from "./shared/notFound";

const app: Application = express();

app.use(cors());
app.use(express.json());
app.use(urlencoded({ extended: true }));

app.get("/", (req: Request, res: Response) => {
  res.send({
    message: "server is running",
  });
});
app.use("/api/v1", router);
app.use(globalError);
app.use(notFound);

export default app;

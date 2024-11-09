import express from "express";
import { userRouter } from "../app/modules/User/user.router";
const router = express.Router();

const routeArray = [
  {
    path: "/user",
    route: userRouter,
  },
];

routeArray.forEach((route) => router.use(route.path, route.route));

export default router;

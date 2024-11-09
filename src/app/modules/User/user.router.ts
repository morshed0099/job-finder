import express from "express";
import { userControler } from "./user.controler";

const router = express.Router();

router.post("/", userControler.createAdmin);

export const userRouter = router;

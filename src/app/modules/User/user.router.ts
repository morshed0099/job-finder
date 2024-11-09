import express from "express";
import { userControler } from "./user.controler";

const router = express.Router();
router.post("/", userControler.createUser);


export const userRouter = router;

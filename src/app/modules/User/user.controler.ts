import { Request, Response } from "express";
import { userService } from "./user.service";
import catchAsync from "../../../shared/catchAsync";

const createUser = catchAsync(async (req, res) => {
  const userInfo = req.body;
  const result = await userService.createUser(userInfo);
  res.status(201).json({
    success: true,
    message: "user created successfully",
    data: result,
  });
});
export const userControler = {
  createUser,
};

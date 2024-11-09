import { Request, Response } from "express";
import { userService } from "./user.service";
import catchAsync from "../../../shared/catchAsync";

const createAdmin = catchAsync (async (req: Request, res: Response) => {
  const result = await userService.createAdmin(req.body);
  res.status(200).json({
    success:true,
    message:"admin created successfully",
    data:result
  });
});

export const userControler = {
  createAdmin,
};

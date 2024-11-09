import { NextFunction, Request, Response } from "express";

const globalError = (
  error: any,
  req: Request,
  res: Response,
  next: NextFunction
) => {
  res.status(error.status || 500).json({
    success: false,
    message: error.message || "something went wrong !!",
    statusCode: error.status,
    error,
  });
};

export default globalError

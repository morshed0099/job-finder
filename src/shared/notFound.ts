import { Request, Response } from "express";

const notFound = (req: Request, res: Response) => {
  res.status(404).json({
    message: `${req.originalUrl} not found !!`,
  });
};
export default notFound;

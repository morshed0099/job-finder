import { PrismaClient, UserRole } from "@prisma/client";
import bcrypt from "bcrypt";
import { prisma } from "../../../helper/prisma";

// normal user create
const createUser = async (data: any) => {
  const hassPassword = await bcrypt.hash(data?.password, 12);
  data.password = hassPassword;
  const userData = await prisma.user.create({
    data,
  });
  return userData;
};

export const userService = {
  createUser,
};

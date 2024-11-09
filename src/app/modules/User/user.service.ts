import { PrismaClient, UserRole } from "@prisma/client";
import bcrypt from "bcrypt";

const prisma = new PrismaClient();

const createAdmin = async (data: any) => {
  const hassPassword: string = await bcrypt.hash(data.password, 12);
  const user = {
    email: data.admin.email,
    role: UserRole.Admin,
    password: hassPassword,
  };

  const adminData = {
    email: data.admin.email,
    name: data.admin.name,
    phoneNumber: data.admin.phoneNumber,
  };
  const result = await prisma.$transaction(async (transaction) => {
    await transaction.user.create({
      data: user,
    });
    const amdinResult = await transaction.admin.create({
      data: adminData,
    });
    return amdinResult;
  });
  return result;
};

export const userService = {
  createAdmin,
};

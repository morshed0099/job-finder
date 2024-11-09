-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('Admin', 'Normal', 'SuperAdmin');

-- CreateEnum
CREATE TYPE "UserStatus" AS ENUM ('Block', 'Active');

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "status" "UserStatus" NOT NULL DEFAULT 'Active',
    "password" TEXT NOT NULL,
    "role" "UserRole" NOT NULL,
    "crateAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "admin" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "profilePhoto" TEXT,
    "phoneNumber" TEXT NOT NULL,
    "isDeleted" BOOLEAN NOT NULL DEFAULT false,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "admin_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "admin_email_key" ON "admin"("email");

-- AddForeignKey
ALTER TABLE "admin" ADD CONSTRAINT "admin_email_fkey" FOREIGN KEY ("email") REFERENCES "users"("email") ON DELETE RESTRICT ON UPDATE CASCADE;

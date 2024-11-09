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
    "role" "UserRole" NOT NULL DEFAULT 'Normal',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "profile" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "phoneNumber" TEXT,
    "about" TEXT,
    "photo" TEXT,
    "email" TEXT NOT NULL,
    "linkedin" TEXT,
    "github" TEXT,
    "protfolio" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "profile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "parmanent_address" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "house" TEXT,
    "rode" TEXT,
    "village" TEXT,
    "postOffice" TEXT,
    "thana" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "distic" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "parmanent_address_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "skill" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "skill_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_skill" (
    "skillId" TEXT NOT NULL,
    "userEmail" TEXT NOT NULL,

    CONSTRAINT "user_skill_pkey" PRIMARY KEY ("skillId","userEmail")
);

-- CreateTable
CREATE TABLE "experience" (
    "id" TEXT NOT NULL,
    "conpanyName" TEXT NOT NULL,
    "designation" TEXT NOT NULL,
    "startDate" TEXT NOT NULL,
    "endDate" TEXT NOT NULL,
    "resposibilities" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "experience_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_experience" (
    "experienceId" TEXT NOT NULL,
    "userEmail" TEXT NOT NULL,

    CONSTRAINT "user_experience_pkey" PRIMARY KEY ("userEmail","experienceId")
);

-- CreateTable
CREATE TABLE "present_address" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "house" TEXT,
    "rode" TEXT,
    "village" TEXT,
    "postOffice" TEXT,
    "thana" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "distic" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "present_address_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Education" (
    "id" TEXT NOT NULL,
    "degreeTitle" TEXT NOT NULL,
    "institue" TEXT NOT NULL,
    "result" DOUBLE PRECISION NOT NULL,
    "passingYear" INTEGER NOT NULL,

    CONSTRAINT "Education_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user_education" (
    "institueId" TEXT NOT NULL,
    "userEmail" TEXT NOT NULL,

    CONSTRAINT "user_education_pkey" PRIMARY KEY ("institueId","userEmail")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "profile_email_key" ON "profile"("email");

-- CreateIndex
CREATE UNIQUE INDEX "parmanent_address_email_key" ON "parmanent_address"("email");

-- CreateIndex
CREATE UNIQUE INDEX "present_address_email_key" ON "present_address"("email");

-- AddForeignKey
ALTER TABLE "profile" ADD CONSTRAINT "profile_email_fkey" FOREIGN KEY ("email") REFERENCES "users"("email") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "parmanent_address" ADD CONSTRAINT "parmanent_address_email_fkey" FOREIGN KEY ("email") REFERENCES "users"("email") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_skill" ADD CONSTRAINT "user_skill_userEmail_fkey" FOREIGN KEY ("userEmail") REFERENCES "users"("email") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_skill" ADD CONSTRAINT "user_skill_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "skill"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_experience" ADD CONSTRAINT "user_experience_userEmail_fkey" FOREIGN KEY ("userEmail") REFERENCES "users"("email") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_experience" ADD CONSTRAINT "user_experience_experienceId_fkey" FOREIGN KEY ("experienceId") REFERENCES "experience"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "present_address" ADD CONSTRAINT "present_address_email_fkey" FOREIGN KEY ("email") REFERENCES "users"("email") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_education" ADD CONSTRAINT "user_education_userEmail_fkey" FOREIGN KEY ("userEmail") REFERENCES "users"("email") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "user_education" ADD CONSTRAINT "user_education_institueId_fkey" FOREIGN KEY ("institueId") REFERENCES "Education"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

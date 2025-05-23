-- DropForeignKey
ALTER TABLE "Specification" DROP CONSTRAINT "Specification_computerId_fkey";

-- AlterTable
ALTER TABLE "Specification" ADD COLUMN     "powerSupply" TEXT,
ALTER COLUMN "cpu" DROP NOT NULL,
ALTER COLUMN "cpuCooler" DROP NOT NULL,
ALTER COLUMN "memory" DROP NOT NULL,
ALTER COLUMN "motherboard" DROP NOT NULL,
ALTER COLUMN "gpu" DROP NOT NULL,
ALTER COLUMN "case" DROP NOT NULL,
ALTER COLUMN "os" DROP NOT NULL,
ALTER COLUMN "computerId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Specification" ADD CONSTRAINT "Specification_computerId_fkey" FOREIGN KEY ("computerId") REFERENCES "Product"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- CreateTable
CREATE TABLE "Product" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "images" TEXT[],
    "brand" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "stock" INTEGER NOT NULL,
    "price" DECIMAL(12,2) NOT NULL DEFAULT 0,
    "rating" DECIMAL(3,2) NOT NULL DEFAULT 0,
    "numReviews" INTEGER NOT NULL DEFAULT 0,
    "isFeatured" BOOLEAN NOT NULL DEFAULT false,
    "banner" TEXT,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Specification" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "cpu" TEXT NOT NULL,
    "cpuCooler" TEXT NOT NULL,
    "memory" TEXT NOT NULL,
    "motherboard" TEXT NOT NULL,
    "gpu" TEXT NOT NULL,
    "storage" TEXT[],
    "case" TEXT NOT NULL,
    "os" TEXT NOT NULL,
    "computerId" UUID NOT NULL,

    CONSTRAINT "Specification_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "product_slug_idx" ON "Product"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "Specification_computerId_key" ON "Specification"("computerId");

-- AddForeignKey
ALTER TABLE "Specification" ADD CONSTRAINT "Specification_computerId_fkey" FOREIGN KEY ("computerId") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

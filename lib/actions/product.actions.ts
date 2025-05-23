"use server";

import prisma from "@/db/prisma";
import { convertToPlainObject } from "../utils";
import { LATEST_PRODUCTS_LIMIT } from "../constants";

export async function getLatestProducts() {
  const data = await prisma.product.findMany({
    take: LATEST_PRODUCTS_LIMIT,
    orderBy: { createdAt: "desc" },
  });

  return convertToPlainObject(data);
}

export async function getProductBySlug(slug: string) {
  return await prisma.product.findFirst({
    where: { slug: slug },
    select: {
      name: true,
      slug: true,
      category: true,
      images: true,
      brand: true,
      description: true,
      stock: true,
      price: true,
      rating: true,
      numReviews: true,
      isFeatured: true,
      Specification: {
        select: {
          cpu: true,
          cpuCooler: true,
          memory: true,
          motherboard: true,
          gpu: true,
          storage: true,
          case: true,
          os: true,
          powerSupply: true,
        },
      },
    },
  });
}

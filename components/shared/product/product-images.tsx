"use client";
import { useState } from "react";
import Image from "next/image";
import { cn } from "@/lib/utils";

function ProductImages({ images }: { images: string[] }) {
  const [current, setCurrent] = useState(0);
  return (
    <div className="space-y-4">
      <Image
        src={images[current]}
        alt="Product Image"
        height={750}
        width={750}
        priority={true}
      />
      <div className="flex">
        {images.map((image, index) => {
          return (
            <div
              key={image}
              onClick={() => {
                setCurrent(index);
              }}
              className={cn(
                "border mr-2 cursor-pointer hover:border-green-200",
                current === index && "border-green-500"
              )}
            >
              <Image src={image} alt="image" width={100} height={100} />
            </div>
          );
        })}
      </div>
    </div>
  );
}

export default ProductImages;

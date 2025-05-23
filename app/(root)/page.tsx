import ProductList from "@/components/shared/product/product-list";
import { getLatestProducts } from "@/lib/actions/product.actions";

async function Homepage() {
  const latestProducts = await getLatestProducts();

  return (
    <>
      <section className="sm:h-[300px] flex flex-col justify-center p-4">
        <h1 className="text-left font-extrabold text-2xl leading-8 mb-2">
          Before you buy a brand new computer...
        </h1>
        <p className="text-md sm:text-lg font-light leading-5 text-slate-600 dark:text-zinc-300">
          Our mission is to reduce e-waste by building refurbished computers
          that are as good as new
        </p>
      </section>
      <ProductList data={latestProducts} title="Newest Arrivals" limit={4} />
    </>
  );
}

export default Homepage;

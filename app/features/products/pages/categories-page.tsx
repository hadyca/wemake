import type { Route } from "../../../+types/features/products/pages/categories-page";
import type { MetaFunction } from "@react-router/types";

export function meta(): MetaFunction {
  return [
    { title: "Categories | ProductHunt Clone" },
    { name: "description", content: "Browse products by category" },
  ];
}

export function loader({ request }: Route.LoaderArgs) {
  return {
    categories: [], // Add categories fetch logic
  };
}

export default function CategoriesPage({ loaderData }: Route.ComponentProps) {
  return (
    <div className="container mx-auto px-4 py-8">
      <h1 className="text-3xl font-bold mb-6">Categories</h1>
      {/* Add categories grid */}
    </div>
  );
}

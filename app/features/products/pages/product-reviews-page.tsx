import { Button } from "~/common/components/ui/button";
import { ReviewCard } from "../components/review-card";

export function meta() {
  return [
    { title: "Product Reviews | wemake" },
    { name: "description", content: "Read and write product reviews" },
  ];
}

export default function ProductReviewsPage() {
  return (
    <div className="space-y-10 max-w-xl">
      <div className="flex justify-between items-center">
        <h2 className="text-2xl font-bold">10 Reviews </h2>
        <Button variant={"secondary"}>Write a review</Button>
      </div>
      <div className="space-y-20">
        {Array.from({ length: 10 }).map((_, i) => (
          <ReviewCard
            username="John Doe"
            handle="@username"
            avatarUrl="https://github.com/facebook.png"
            rating={5}
            content="Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quos. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quos. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quos."
            postedAt="10 days ago"
          />
        ))}
      </div>
    </div>
  );
}

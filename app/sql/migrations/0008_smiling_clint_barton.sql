ALTER TABLE "team" RENAME TO "teams";--> statement-breakpoint
ALTER TABLE "teams" DROP CONSTRAINT "team_size_check";--> statement-breakpoint
ALTER TABLE "teams" DROP CONSTRAINT "equity_split_check";--> statement-breakpoint
ALTER TABLE "teams" DROP CONSTRAINT "product_description_check";--> statement-breakpoint
ALTER TABLE "teams" ADD CONSTRAINT "team_size_check" CHECK ("teams"."team_size" BETWEEN 1 AND 100);--> statement-breakpoint
ALTER TABLE "teams" ADD CONSTRAINT "equity_split_check" CHECK ("teams"."equity_split" BETWEEN 1 AND 100);--> statement-breakpoint
ALTER TABLE "teams" ADD CONSTRAINT "product_description_check" CHECK (LENGTH("teams"."product_description") <= 200);
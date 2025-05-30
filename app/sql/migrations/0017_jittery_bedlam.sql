CREATE TABLE "todos" (
	"todo_id" bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY (sequence name "todos_todo_id_seq" INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 START WITH 1 CACHE 1),
	"title" text NOT NULL,
	"completed" boolean DEFAULT false NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL,
	"profile_id" uuid NOT NULL
);
--> statement-breakpoint
ALTER TABLE "todos" ENABLE ROW LEVEL SECURITY;--> statement-breakpoint
ALTER TABLE "message_room_members" ENABLE ROW LEVEL SECURITY;--> statement-breakpoint
ALTER TABLE "profiles" ALTER COLUMN "stats" SET DEFAULT '{"followers":0,"following":0}'::jsonb;--> statement-breakpoint
ALTER TABLE "follows" ADD CONSTRAINT "follows_follower_id_following_id_pk" PRIMARY KEY("follower_id","following_id");--> statement-breakpoint
ALTER TABLE "todos" ADD CONSTRAINT "todos_profile_id_profiles_profile_id_fk" FOREIGN KEY ("profile_id") REFERENCES "public"."profiles"("profile_id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
CREATE POLICY "message_room_members_policy" ON "message_room_members" AS PERMISSIVE FOR SELECT TO "authenticated" USING (public.is_user_member("message_room_members"."message_room_id", auth.uid()));--> statement-breakpoint
CREATE POLICY "todos-insert-policy" ON "todos" AS PERMISSIVE FOR INSERT TO "authenticated" WITH CHECK ((select auth.uid()) = "todos"."profile_id");--> statement-breakpoint
CREATE POLICY "todos-select-policy" ON "todos" AS PERMISSIVE FOR SELECT TO "authenticated" USING ((select auth.uid()) = "todos"."profile_id");
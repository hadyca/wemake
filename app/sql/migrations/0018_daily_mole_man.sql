ALTER TABLE "message_room_members" DISABLE ROW LEVEL SECURITY;--> statement-breakpoint
DROP POLICY "message_room_members_policy" ON "message_room_members" CASCADE;
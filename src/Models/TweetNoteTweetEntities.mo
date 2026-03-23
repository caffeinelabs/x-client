
import { type CashtagEntity; JSON = CashtagEntity } "./CashtagEntity";

import { type HashtagEntity; JSON = HashtagEntity } "./HashtagEntity";

import { type MentionEntity; JSON = MentionEntity } "./MentionEntity";

import { type UrlEntity; JSON = UrlEntity } "./UrlEntity";

// TweetNoteTweetEntities.mo

module {
    // User-facing type: what application code uses
    public type TweetNoteTweetEntities = {
        cashtags : ?[CashtagEntity];
        hashtags : ?[HashtagEntity];
        mentions : ?[MentionEntity];
        urls : ?[UrlEntity];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetNoteTweetEntities type
        public type JSON = {
            cashtags : ?[CashtagEntity];
            hashtags : ?[HashtagEntity];
            mentions : ?[MentionEntity];
            urls : ?[UrlEntity];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetNoteTweetEntities) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetNoteTweetEntities = ?json;
    }
}

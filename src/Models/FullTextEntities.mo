
import { type CashtagEntity; JSON = CashtagEntity } "./CashtagEntity";

import { type FullTextEntitiesAnnotationsInner; JSON = FullTextEntitiesAnnotationsInner } "./FullTextEntitiesAnnotationsInner";

import { type HashtagEntity; JSON = HashtagEntity } "./HashtagEntity";

import { type MentionEntity; JSON = MentionEntity } "./MentionEntity";

import { type UrlEntity; JSON = UrlEntity } "./UrlEntity";

// FullTextEntities.mo

module {
    // User-facing type: what application code uses
    public type FullTextEntities = {
        annotations : ?[FullTextEntitiesAnnotationsInner];
        cashtags : ?[CashtagEntity];
        hashtags : ?[HashtagEntity];
        mentions : ?[MentionEntity];
        urls : ?[UrlEntity];
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer FullTextEntities type
        public type JSON = {
            annotations : ?[FullTextEntitiesAnnotationsInner];
            cashtags : ?[CashtagEntity];
            hashtags : ?[HashtagEntity];
            mentions : ?[MentionEntity];
            urls : ?[UrlEntity];
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : FullTextEntities) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?FullTextEntities = ?json;
    }
}

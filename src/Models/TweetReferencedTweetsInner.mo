
import { type TweetReferencedTweetsInnerType; JSON = TweetReferencedTweetsInnerType } "./TweetReferencedTweetsInnerType";

// TweetReferencedTweetsInner.mo

module {
    // User-facing type: what application code uses
    public type TweetReferencedTweetsInner = {
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        id : Text;
        type_ : TweetReferencedTweetsInnerType;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetReferencedTweetsInner type
        public type JSON = {
            id : Text;
            type_ : TweetReferencedTweetsInnerType.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetReferencedTweetsInner) : JSON = { value with
            type_ = TweetReferencedTweetsInnerType.toJSON(value.type_);
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetReferencedTweetsInner {
            let ?type_ = TweetReferencedTweetsInnerType.fromJSON(json.type_) else return null;
            ?{ json with
                type_;
            }
        };
    }
}

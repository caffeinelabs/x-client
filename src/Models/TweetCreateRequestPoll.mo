
import { type TweetCreateRequestPollReplySettings; JSON = TweetCreateRequestPollReplySettings } "./TweetCreateRequestPollReplySettings";

import Int "mo:core/Int";

// TweetCreateRequestPoll.mo
/// Poll options for a Tweet with a poll. This is mutually exclusive from Media, Quote Tweet Id, and Card URI.

module {
    // User-facing type: what application code uses
    public type TweetCreateRequestPoll = {
        /// Duration of the poll in minutes.
        duration_minutes : Nat;
        options : [Text];
        reply_settings : ?TweetCreateRequestPollReplySettings;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetCreateRequestPoll type
        public type JSON = {
            duration_minutes : Int;
            options : [Text];
            reply_settings : ?TweetCreateRequestPollReplySettings.JSON;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetCreateRequestPoll) : JSON = { value with
            reply_settings = do ? { TweetCreateRequestPollReplySettings.toJSON(value.reply_settings!) };
        };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetCreateRequestPoll {
            ?{ json with
                duration_minutes = if (json.duration_minutes < 0) return null else Int.abs(json.duration_minutes);
                reply_settings = do ? { TweetCreateRequestPollReplySettings.fromJSON(json.reply_settings!)! };
            }
        };
    }
}

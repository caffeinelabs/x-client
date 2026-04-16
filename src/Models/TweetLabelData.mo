/// Tweet label data.

import { type TweetNotice; JSON = TweetNotice } "./TweetNotice";

import { type TweetNoticeSchema; JSON = TweetNoticeSchema } "./TweetNoticeSchema";

import { type TweetUnviewable; JSON = TweetUnviewable } "./TweetUnviewable";

import { type TweetUnviewableSchema; JSON = TweetUnviewableSchema } "./TweetUnviewableSchema";

// TweetLabelData.mo
import Runtime "mo:core/Runtime";

module {
    // User-facing type: discriminated union (oneOf)
    public type TweetLabelData = {
        #TweetNoticeSchema : TweetNoticeSchema;
        #TweetUnviewableSchema : TweetUnviewableSchema;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // Convert oneOf variant to Text for URL parameters
        public func toText(value : TweetLabelData) : Text =
            switch (value) {
                case (#TweetNoticeSchema(v)) Runtime.unreachable();
                case (#TweetUnviewableSchema(v)) Runtime.unreachable();
            };

        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer TweetLabelData type
        public type JSON = {
            #TweetNoticeSchema : TweetNoticeSchema;
            #TweetUnviewableSchema : TweetUnviewableSchema;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : TweetLabelData) : JSON =
            switch (value) {
                case (#TweetNoticeSchema(v)) #TweetNoticeSchema(v);
                case (#TweetUnviewableSchema(v)) #TweetUnviewableSchema(v);
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?TweetLabelData =
            switch (json) {
                case (#TweetNoticeSchema(v)) ?#TweetNoticeSchema(v);
                case (#TweetUnviewableSchema(v)) ?#TweetUnviewableSchema(v);
            };
    }
}

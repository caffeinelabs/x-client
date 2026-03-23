
// GetPostsCountsAllSearchCountFieldsParameterInner.mo
/// Enum values: #end, #start, #tweet_count

module {
    // User-facing type: type-safe variants for application code
    public type GetPostsCountsAllSearchCountFieldsParameterInner = {
        #end;
        #start;
        #tweet_count;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetPostsCountsAllSearchCountFieldsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetPostsCountsAllSearchCountFieldsParameterInner) : JSON =
            switch (value) {
                case (#end) "end";
                case (#start) "start";
                case (#tweet_count) "tweet_count";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetPostsCountsAllSearchCountFieldsParameterInner =
            switch (json) {
                case "end" ?#end;
                case "start" ?#start;
                case "tweet_count" ?#tweet_count;
                case _ null;
            };
    }
}

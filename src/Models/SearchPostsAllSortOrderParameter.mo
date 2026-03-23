
// SearchPostsAllSortOrderParameter.mo
/// Enum values: #recency, #relevancy

module {
    // User-facing type: type-safe variants for application code
    public type SearchPostsAllSortOrderParameter = {
        #recency;
        #relevancy;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer SearchPostsAllSortOrderParameter type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : SearchPostsAllSortOrderParameter) : JSON =
            switch (value) {
                case (#recency) "recency";
                case (#relevancy) "relevancy";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?SearchPostsAllSortOrderParameter =
            switch (json) {
                case "recency" ?#recency;
                case "relevancy" ?#relevancy;
                case _ null;
            };
    }
}

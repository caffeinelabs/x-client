/// A X List is a curated group of accounts.

// List.mo

module {
    // User-facing type: what application code uses
    public type List = {
        created_at : ?Text;
        description : ?Text;
        follower_count : ?Int;
        /// The unique identifier of this List.
        id : Text;
        member_count : ?Int;
        /// The name of this List.
        name : Text;
        /// Unique identifier of this User. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        owner_id : ?Text;
        private_ : ?Bool;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer List type
        public type JSON = {
            created_at : ?Text;
            description : ?Text;
            follower_count : ?Int;
            id : Text;
            member_count : ?Int;
            name : Text;
            owner_id : ?Text;
            private_ : ?Bool;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : List) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?List = ?json;
    }
}

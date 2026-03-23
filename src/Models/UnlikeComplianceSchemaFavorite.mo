
// UnlikeComplianceSchemaFavorite.mo

module {
    // User-facing type: what application code uses
    public type UnlikeComplianceSchemaFavorite = {
        /// Unique identifier of this Tweet. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        id : Text;
        /// Unique identifier of this User. This is returned as a string in order to avoid complications with languages and tools that cannot handle large integers.
        user_id : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UnlikeComplianceSchemaFavorite type
        public type JSON = {
            id : Text;
            user_id : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UnlikeComplianceSchemaFavorite) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UnlikeComplianceSchemaFavorite = ?json;
    }
}

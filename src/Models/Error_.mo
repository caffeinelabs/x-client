
// Error_.mo

module {
    // User-facing type: what application code uses
    public type Error_ = {
        code : Int;
        message : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Error_ type
        public type JSON = {
            code : Int;
            message : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Error_) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Error_ = ?json;
    }
}

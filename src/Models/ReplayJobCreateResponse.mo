/// Confirmation that the replay job request was accepted.

// ReplayJobCreateResponse.mo

module {
    // User-facing type: what application code uses
    public type ReplayJobCreateResponse = {
        /// The UTC timestamp indicating when the replay job was created.
        created_at : Text;
        /// The unique identifier for the initiated replay job.
        job_id : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer ReplayJobCreateResponse type
        public type JSON = {
            created_at : Text;
            job_id : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : ReplayJobCreateResponse) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?ReplayJobCreateResponse = ?json;
    }
}

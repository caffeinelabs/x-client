
// GetSpacesByIdsExpansionsParameterInner.mo
/// Enum values: #creator_id, #host_ids, #invited_user_ids, #speaker_ids, #topic_ids

module {
    // User-facing type: type-safe variants for application code
    public type GetSpacesByIdsExpansionsParameterInner = {
        #creator_id;
        #host_ids;
        #invited_user_ids;
        #speaker_ids;
        #topic_ids;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetSpacesByIdsExpansionsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetSpacesByIdsExpansionsParameterInner) : JSON =
            switch (value) {
                case (#creator_id) "creator_id";
                case (#host_ids) "host_ids";
                case (#invited_user_ids) "invited_user_ids";
                case (#speaker_ids) "speaker_ids";
                case (#topic_ids) "topic_ids";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetSpacesByIdsExpansionsParameterInner =
            switch (json) {
                case "creator_id" ?#creator_id;
                case "host_ids" ?#host_ids;
                case "invited_user_ids" ?#invited_user_ids;
                case "speaker_ids" ?#speaker_ids;
                case "topic_ids" ?#topic_ids;
                case _ null;
            };
    }
}

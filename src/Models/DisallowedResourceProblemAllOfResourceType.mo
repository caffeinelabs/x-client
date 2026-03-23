
// DisallowedResourceProblemAllOfResourceType.mo
/// Enum values: #user, #tweet, #media, #list, #space

module {
    // User-facing type: type-safe variants for application code
    public type DisallowedResourceProblemAllOfResourceType = {
        #user;
        #tweet;
        #media;
        #list;
        #space;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer DisallowedResourceProblemAllOfResourceType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : DisallowedResourceProblemAllOfResourceType) : JSON =
            switch (value) {
                case (#user) "user";
                case (#tweet) "tweet";
                case (#media) "media";
                case (#list) "list";
                case (#space) "space";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?DisallowedResourceProblemAllOfResourceType =
            switch (json) {
                case "user" ?#user;
                case "tweet" ?#tweet;
                case "media" ?#media;
                case "list" ?#list;
                case "space" ?#space;
                case _ null;
            };
    }
}

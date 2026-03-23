
// GetUsersPublicKeysPublicKeyFieldsParameterInner.mo
/// Enum values: #juicebox_config, #public_key, #signing_public_key, #version

module {
    // User-facing type: type-safe variants for application code
    public type GetUsersPublicKeysPublicKeyFieldsParameterInner = {
        #juicebox_config;
        #public_key;
        #signing_public_key;
        #version;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetUsersPublicKeysPublicKeyFieldsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetUsersPublicKeysPublicKeyFieldsParameterInner) : JSON =
            switch (value) {
                case (#juicebox_config) "juicebox_config";
                case (#public_key) "public_key";
                case (#signing_public_key) "signing_public_key";
                case (#version) "version";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetUsersPublicKeysPublicKeyFieldsParameterInner =
            switch (json) {
                case "juicebox_config" ?#juicebox_config;
                case "public_key" ?#public_key;
                case "signing_public_key" ?#signing_public_key;
                case "version" ?#version;
                case _ null;
            };
    }
}

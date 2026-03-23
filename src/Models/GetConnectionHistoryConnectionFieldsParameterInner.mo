
// GetConnectionHistoryConnectionFieldsParameterInner.mo
/// Enum values: #client_ip, #connected_at, #disconnect_reason, #disconnected_at, #endpoint_name, #id

module {
    // User-facing type: type-safe variants for application code
    public type GetConnectionHistoryConnectionFieldsParameterInner = {
        #client_ip;
        #connected_at;
        #disconnect_reason;
        #disconnected_at;
        #endpoint_name;
        #id;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer GetConnectionHistoryConnectionFieldsParameterInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : GetConnectionHistoryConnectionFieldsParameterInner) : JSON =
            switch (value) {
                case (#client_ip) "client_ip";
                case (#connected_at) "connected_at";
                case (#disconnect_reason) "disconnect_reason";
                case (#disconnected_at) "disconnected_at";
                case (#endpoint_name) "endpoint_name";
                case (#id) "id";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?GetConnectionHistoryConnectionFieldsParameterInner =
            switch (json) {
                case "client_ip" ?#client_ip;
                case "connected_at" ?#connected_at;
                case "disconnect_reason" ?#disconnect_reason;
                case "disconnected_at" ?#disconnected_at;
                case "endpoint_name" ?#endpoint_name;
                case "id" ?#id;
                case _ null;
            };
    }
}

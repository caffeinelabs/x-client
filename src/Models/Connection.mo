
// Connection.mo

module {
    // User-facing type: what application code uses
    public type Connection = {
        /// The IP address of the connected client.
        client_ip : ?Text;
        /// The timestamp when the connection was established.
        connected_at : Text;
        /// The reason for disconnection, if the connection is inactive.
        disconnect_reason : ?Text;
        /// The timestamp when the connection was disconnected, if applicable.
        disconnected_at : ?Text;
        /// The name of the streaming endpoint.
        endpoint_name : Text;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer Connection type
        public type JSON = {
            client_ip : ?Text;
            connected_at : Text;
            disconnect_reason : ?Text;
            disconnected_at : ?Text;
            endpoint_name : Text;
        };

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : Connection) : JSON = value;

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?Connection = ?json;
    }
}

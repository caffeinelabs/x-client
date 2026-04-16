/// Type of connection between users.

// UserConnectionStatusInner.mo
/// Enum values: #follow_request_received, #follow_request_sent, #blocking, #followed_by, #following, #muting

module {
    // User-facing type: type-safe variants for application code
    public type UserConnectionStatusInner = {
        #follow_request_received;
        #follow_request_sent;
        #blocking;
        #followed_by;
        #following;
        #muting;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer UserConnectionStatusInner type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : UserConnectionStatusInner) : JSON =
            switch (value) {
                case (#follow_request_received) "follow_request_received";
                case (#follow_request_sent) "follow_request_sent";
                case (#blocking) "blocking";
                case (#followed_by) "followed_by";
                case (#following) "following";
                case (#muting) "muting";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?UserConnectionStatusInner =
            switch (json) {
                case "follow_request_received" ?#follow_request_received;
                case "follow_request_sent" ?#follow_request_sent;
                case "blocking" ?#blocking;
                case "followed_by" ?#followed_by;
                case "following" ?#following;
                case "muting" ?#muting;
                case _ null;
            };
    }
}

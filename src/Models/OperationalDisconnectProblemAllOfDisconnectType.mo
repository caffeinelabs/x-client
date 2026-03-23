
// OperationalDisconnectProblemAllOfDisconnectType.mo
/// Enum values: #operationaldisconnect, #upstreamoperationaldisconnect, #forcedisconnect, #upstreamuncleandisconnect, #slowreader, #internalerror, #clientapplicationstatedegraded, #invalidrules

module {
    // User-facing type: type-safe variants for application code
    public type OperationalDisconnectProblemAllOfDisconnectType = {
        #operationaldisconnect;
        #upstreamoperationaldisconnect;
        #forcedisconnect;
        #upstreamuncleandisconnect;
        #slowreader;
        #internalerror;
        #clientapplicationstatedegraded;
        #invalidrules;
    };

    // JSON sub-module: everything needed for JSON serialization
    public module JSON {
        // JSON-facing Motoko type: mirrors JSON structure
        // Named "JSON" to avoid shadowing the outer OperationalDisconnectProblemAllOfDisconnectType type
        public type JSON = Text;

        // Convert User-facing type to JSON-facing Motoko type
        public func toJSON(value : OperationalDisconnectProblemAllOfDisconnectType) : JSON =
            switch (value) {
                case (#operationaldisconnect) "OperationalDisconnect";
                case (#upstreamoperationaldisconnect) "UpstreamOperationalDisconnect";
                case (#forcedisconnect) "ForceDisconnect";
                case (#upstreamuncleandisconnect) "UpstreamUncleanDisconnect";
                case (#slowreader) "SlowReader";
                case (#internalerror) "InternalError";
                case (#clientapplicationstatedegraded) "ClientApplicationStateDegraded";
                case (#invalidrules) "InvalidRules";
            };

        // Convert JSON-facing Motoko type to User-facing type
        public func fromJSON(json : JSON) : ?OperationalDisconnectProblemAllOfDisconnectType =
            switch (json) {
                case "OperationalDisconnect" ?#operationaldisconnect;
                case "UpstreamOperationalDisconnect" ?#upstreamoperationaldisconnect;
                case "ForceDisconnect" ?#forcedisconnect;
                case "UpstreamUncleanDisconnect" ?#upstreamuncleandisconnect;
                case "SlowReader" ?#slowreader;
                case "InternalError" ?#internalerror;
                case "ClientApplicationStateDegraded" ?#clientapplicationstatedegraded;
                case "InvalidRules" ?#invalidrules;
                case _ null;
            };
    }
}

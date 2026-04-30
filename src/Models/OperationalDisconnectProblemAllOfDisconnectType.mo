import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// OperationalDisconnectProblemAllOfDisconnectType.mo
/// Enum values: #operationaldisconnect, #upstreamoperationaldisconnect, #forcedisconnect, #upstreamuncleandisconnect, #slowreader, #internalerror, #clientapplicationstatedegraded, #invalidrules

module {
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

    public module JSON {
        public func toCandidValue(value : OperationalDisconnectProblemAllOfDisconnectType) : Candid.Candid =
            switch (value) {
                case (#operationaldisconnect) #Text("OperationalDisconnect");
                case (#upstreamoperationaldisconnect) #Text("UpstreamOperationalDisconnect");
                case (#forcedisconnect) #Text("ForceDisconnect");
                case (#upstreamuncleandisconnect) #Text("UpstreamUncleanDisconnect");
                case (#slowreader) #Text("SlowReader");
                case (#internalerror) #Text("InternalError");
                case (#clientapplicationstatedegraded) #Text("ClientApplicationStateDegraded");
                case (#invalidrules) #Text("InvalidRules");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?OperationalDisconnectProblemAllOfDisconnectType =
            switch (candid) {
                case (#Text("OperationalDisconnect")) ?#operationaldisconnect;
                case (#Text("UpstreamOperationalDisconnect")) ?#upstreamoperationaldisconnect;
                case (#Text("ForceDisconnect")) ?#forcedisconnect;
                case (#Text("UpstreamUncleanDisconnect")) ?#upstreamuncleandisconnect;
                case (#Text("SlowReader")) ?#slowreader;
                case (#Text("InternalError")) ?#internalerror;
                case (#Text("ClientApplicationStateDegraded")) ?#clientapplicationstatedegraded;
                case (#Text("InvalidRules")) ?#invalidrules;
                case _ null;
            };

        public func toText(value : OperationalDisconnectProblemAllOfDisconnectType) : Text =
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
    };
};

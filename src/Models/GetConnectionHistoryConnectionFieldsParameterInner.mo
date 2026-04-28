import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GetConnectionHistoryConnectionFieldsParameterInner.mo
/// Enum values: #client_ip, #connected_at, #disconnect_reason, #disconnected_at, #endpoint_name, #id

module {
    public type GetConnectionHistoryConnectionFieldsParameterInner = {
        #client_ip;
        #connected_at;
        #disconnect_reason;
        #disconnected_at;
        #endpoint_name;
        #id;
    };

    public module JSON {
        public func toCandidValue(value : GetConnectionHistoryConnectionFieldsParameterInner) : Candid.Candid =
            switch (value) {
                case (#client_ip) #Text("client_ip");
                case (#connected_at) #Text("connected_at");
                case (#disconnect_reason) #Text("disconnect_reason");
                case (#disconnected_at) #Text("disconnected_at");
                case (#endpoint_name) #Text("endpoint_name");
                case (#id) #Text("id");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetConnectionHistoryConnectionFieldsParameterInner =
            switch (candid) {
                case (#Text("client_ip")) ?#client_ip;
                case (#Text("connected_at")) ?#connected_at;
                case (#Text("disconnect_reason")) ?#disconnect_reason;
                case (#Text("disconnected_at")) ?#disconnected_at;
                case (#Text("endpoint_name")) ?#endpoint_name;
                case (#Text("id")) ?#id;
                case _ null;
            };

        public func toText(value : GetConnectionHistoryConnectionFieldsParameterInner) : Text =
            switch (value) {
                case (#client_ip) "client_ip";
                case (#connected_at) "connected_at";
                case (#disconnect_reason) "disconnect_reason";
                case (#disconnected_at) "disconnected_at";
                case (#endpoint_name) "endpoint_name";
                case (#id) "id";
            };
    };
};

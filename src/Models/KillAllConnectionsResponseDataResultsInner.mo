import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// KillAllConnectionsResponseDataResultsInner.mo

module {
    public type KillAllConnectionsResponseDataResultsInner = {
        error_message : ?Text;
        success : ?Bool;
        uuid : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : KillAllConnectionsResponseDataResultsInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.error_message) {
                case (?v__) List.add(buf, ("error_message", #Text(v__)));
                case null ();
            };
            switch (value.success) {
                case (?v__) List.add(buf, ("success", #Bool(v__)));
                case null ();
            };
            switch (value.uuid) {
                case (?v__) List.add(buf, ("uuid", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?KillAllConnectionsResponseDataResultsInner =
            switch (candid) {
                case (#Record(fields)) {
                    let error_message : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "error_message")) {
                        case (?error_message_field) ((switch (error_message_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let success : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "success")) {
                        case (?success_field) ((switch (success_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let uuid : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "uuid")) {
                        case (?uuid_field) ((switch (uuid_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        error_message;
                        success;
                        uuid;
                    };
                };
                case _ null;
            };
    };
};

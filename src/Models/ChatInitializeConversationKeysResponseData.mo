import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatInitializeConversationKeysResponseData.mo

module {
    public type ChatInitializeConversationKeysResponseData = {
        /// Sequence ID of the conversation key change event. Use this to track key changes in the conversation event stream.
        sequence_id : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : ChatInitializeConversationKeysResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.sequence_id) {
                case (?v__) List.add(buf, ("sequence_id", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatInitializeConversationKeysResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let sequence_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "sequence_id")) {
                        case (?sequence_id_field) ((switch (sequence_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        sequence_id;
                    };
                };
                case _ null;
            };
    };
};

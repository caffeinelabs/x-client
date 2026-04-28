import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatInitializeGroupResponseData.mo

module {
    public type ChatInitializeGroupResponseData = {
        /// The unique identifier for the initialized group conversation. This ID is prefixed with 'g' (e.g., 'g1234567890123456789'). Use this ID when calling POST /chat/conversations to create the group.
        conversation_id : ?Text;
    };

    public module JSON {
        public func toCandidValue(value : ChatInitializeGroupResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.conversation_id) {
                case (?v__) List.add(buf, ("conversation_id", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatInitializeGroupResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let conversation_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "conversation_id")) {
                        case (?conversation_id_field) ((switch (conversation_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        conversation_id;
                    };
                };
                case _ null;
            };
    };
};

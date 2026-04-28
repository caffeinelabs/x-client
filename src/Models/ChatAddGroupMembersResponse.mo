import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatAddGroupMembersResponse.mo

module {
    public type ChatAddGroupMembersResponse = {
        /// Sequence ID of the conversation key change event.
        conversation_key_change_sequence_id : ?Text;
        /// List of all current member IDs in the conversation.
        current_member_ids : ?[Text];
    };

    public module JSON {
        public func toCandidValue(value : ChatAddGroupMembersResponse) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.conversation_key_change_sequence_id) {
                case (?v__) List.add(buf, ("conversation_key_change_sequence_id", #Text(v__)));
                case null ();
            };
            switch (value.current_member_ids) {
                case (?v__) List.add(buf, ("current_member_ids", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatAddGroupMembersResponse =
            switch (candid) {
                case (#Record(fields)) {
                    let conversation_key_change_sequence_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "conversation_key_change_sequence_id")) {
                        case (?conversation_key_change_sequence_id_field) ((switch (conversation_key_change_sequence_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let current_member_ids : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "current_member_ids")) {
                        case (?current_member_ids_field) ((switch (current_member_ids_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<Text>();
                            for (c__ in xs__.values()) {
                                let #Text(s__) = c__ else return null;
                                List.add(buf__, s__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    ?{
                        conversation_key_change_sequence_id;
                        current_member_ids;
                    };
                };
                case _ null;
            };
    };
};

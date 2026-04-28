import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// GetChatConversationsExpansionsParameterInner.mo
/// Enum values: #admin_ids, #member_ids, #participant_ids

module {
    public type GetChatConversationsExpansionsParameterInner = {
        #admin_ids;
        #member_ids;
        #participant_ids;
    };

    public module JSON {
        public func toCandidValue(value : GetChatConversationsExpansionsParameterInner) : Candid.Candid =
            switch (value) {
                case (#admin_ids) #Text("admin_ids");
                case (#member_ids) #Text("member_ids");
                case (#participant_ids) #Text("participant_ids");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?GetChatConversationsExpansionsParameterInner =
            switch (candid) {
                case (#Text("admin_ids")) ?#admin_ids;
                case (#Text("member_ids")) ?#member_ids;
                case (#Text("participant_ids")) ?#participant_ids;
                case _ null;
            };

        public func toText(value : GetChatConversationsExpansionsParameterInner) : Text =
            switch (value) {
                case (#admin_ids) "admin_ids";
                case (#member_ids) "member_ids";
                case (#participant_ids) "participant_ids";
            };
    };
};

/// The conversation type that is being created.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// CreateDmConversationRequestConversationType.mo
/// Enum values: #group

module {
    public type CreateDmConversationRequestConversationType = {
        #group;
    };

    public module JSON {
        public func toCandidValue(value : CreateDmConversationRequestConversationType) : Candid.Candid =
            switch (value) {
                case (#group) #Text("Group");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?CreateDmConversationRequestConversationType =
            switch (candid) {
                case (#Text("Group")) ?#group;
                case _ null;
            };

        public func toText(value : CreateDmConversationRequestConversationType) : Text =
            switch (value) {
                case (#group) "Group";
            };
    };
};

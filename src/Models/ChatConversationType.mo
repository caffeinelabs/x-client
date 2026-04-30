/// The type of conversation: 'direct' or 'group'.
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatConversationType.mo
/// Enum values: #direct, #group

module {
    public type ChatConversationType = {
        #direct;
        #group;
    };

    public module JSON {
        public func toCandidValue(value : ChatConversationType) : Candid.Candid =
            switch (value) {
                case (#direct) #Text("direct");
                case (#group) #Text("group");
            };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatConversationType =
            switch (candid) {
                case (#Text("direct")) ?#direct;
                case (#Text("group")) ?#group;
                case _ null;
            };

        public func toText(value : ChatConversationType) : Text =
            switch (value) {
                case (#direct) "direct";
                case (#group) "group";
            };
    };
};

import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatSendTypingIndicatorResponseData.mo

module {
    public type ChatSendTypingIndicatorResponseData = {
        /// Whether the typing indicator was sent successfully.
        success : ?Bool;
    };

    public module JSON {
        public func toCandidValue(value : ChatSendTypingIndicatorResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.success) {
                case (?v__) List.add(buf, ("success", #Bool(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ChatSendTypingIndicatorResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let success : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "success")) {
                        case (?success_field) ((switch (success_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    ?{
                        success;
                    };
                };
                case _ null;
            };
    };
};

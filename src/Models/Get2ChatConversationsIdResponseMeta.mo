import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// Get2ChatConversationsIdResponseMeta.mo

module {
    public type Get2ChatConversationsIdResponseMeta = {
        /// The next token.
        next_token : ?Text;
        /// The number of results returned in this response.
        result_count : ?Int;
    };

    public module JSON {
        public func toCandidValue(value : Get2ChatConversationsIdResponseMeta) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.next_token) {
                case (?v__) List.add(buf, ("next_token", #Text(v__)));
                case null ();
            };
            switch (value.result_count) {
                case (?v__) List.add(buf, ("result_count", #Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Get2ChatConversationsIdResponseMeta =
            switch (candid) {
                case (#Record(fields)) {
                    let next_token : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "next_token")) {
                        case (?next_token_field) ((switch (next_token_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let result_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "result_count")) {
                        case (?result_count_field) ((switch (result_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        next_token;
                        result_count;
                    };
                };
                case _ null;
            };
    };
};

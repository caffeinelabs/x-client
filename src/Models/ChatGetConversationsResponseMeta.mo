import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";

// ChatGetConversationsResponseMeta.mo

module {
    public type ChatGetConversationsResponseMeta = {
        /// Whether the user has pending message requests.
        has_message_requests : ?Bool;
        /// Whether there are more conversations to fetch.
        has_more : ?Bool;
        /// Token to retrieve the next page of results.
        next_token : ?Text;
        /// The number of conversations returned.
        result_count : ?Int;
    };

    public module JSON {
        public func toCandidValue(value : ChatGetConversationsResponseMeta) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.has_message_requests) {
                case (?v__) List.add(buf, ("has_message_requests", #Bool(v__)));
                case null ();
            };
            switch (value.has_more) {
                case (?v__) List.add(buf, ("has_more", #Bool(v__)));
                case null ();
            };
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

        public func fromCandidValue(candid : Candid.Candid) : ?ChatGetConversationsResponseMeta =
            switch (candid) {
                case (#Record(fields)) {
                    let has_message_requests : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "has_message_requests")) {
                        case (?has_message_requests_field) ((switch (has_message_requests_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let has_more : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "has_more")) {
                        case (?has_more_field) ((switch (has_more_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let next_token : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "next_token")) {
                        case (?next_token_field) ((switch (next_token_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let result_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "result_count")) {
                        case (?result_count_field) ((switch (result_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        has_message_requests;
                        has_more;
                        next_token;
                        result_count;
                    };
                };
                case _ null;
            };
    };
};

import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ChatGetConversationResponseMeta.mo

module {
    public type ChatGetConversationResponseMeta = {
        /// Conversation key change events needed for decryption.
        conversation_key_events : ?[Text];
        /// Whether there are more messages to fetch.
        has_more : ?Bool;
        /// Token to retrieve the next page of results.
        next_token : ?Text;
        /// The number of message events returned.
        result_count : ?Int;
    };

    public module JSON {
        // `init` constructs a ChatGetConversationResponseMeta from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ChatGetConversationResponseMeta.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : ChatGetConversationResponseMeta {
            let ?res = from_candid(to_candid(required)) : ?ChatGetConversationResponseMeta else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ChatGetConversationResponseMeta) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.conversation_key_events) {
                case (?v__) List.add(buf, ("conversation_key_events", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
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

        public func fromCandidValue(candid : Candid.Candid) : ?ChatGetConversationResponseMeta =
            switch (candid) {
                case (#Record(fields)) {
                    let conversation_key_events : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "conversation_key_events")) {
                        case (?conversation_key_events_field) ((switch (conversation_key_events_field.1) {
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
                        conversation_key_events;
                        has_more;
                        next_token;
                        result_count;
                    };
                };
                case _ null;
            };
    };
};

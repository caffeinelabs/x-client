import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// Get2UsersSearchResponseMeta.mo

module {
    public type Get2UsersSearchResponseMeta = {
        /// The next token.
        next_token : ?Text;
        /// The previous token.
        previous_token : ?Text;
    };

    public module JSON {
        // `init` constructs a Get2UsersSearchResponseMeta from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { Get2UsersSearchResponseMeta.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : {
        }) : Get2UsersSearchResponseMeta {
            let ?res = from_candid(to_candid(required)) : ?Get2UsersSearchResponseMeta else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : Get2UsersSearchResponseMeta) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.next_token) {
                case (?v__) List.add(buf, ("next_token", #Text(v__)));
                case null ();
            };
            switch (value.previous_token) {
                case (?v__) List.add(buf, ("previous_token", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?Get2UsersSearchResponseMeta =
            switch (candid) {
                case (#Record(fields)) {
                    let next_token : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "next_token")) {
                        case (?next_token_field) ((switch (next_token_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let previous_token : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "previous_token")) {
                        case (?previous_token_field) ((switch (previous_token_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        next_token;
                        previous_token;
                    };
                };
                case _ null;
            };
    };
};

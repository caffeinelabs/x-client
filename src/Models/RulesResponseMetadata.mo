
import { type RulesRequestSummary; JSON = RulesRequestSummary } "./RulesRequestSummary";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// RulesResponseMetadata.mo

module {
    /// The required-fields slice of RulesResponseMetadata — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
        sent : Text;
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express RulesResponseMetadata as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        next_token : ?Text;
        result_count : ?Int;
        summary : ?RulesRequestSummary;
    };

    public type RulesResponseMetadata = Required and Optional;

    public module JSON {
        // `init` constructs a RulesResponseMetadata from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { RulesResponseMetadata.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : RulesResponseMetadata {
            let ?res = from_candid(to_candid(required)) : ?RulesResponseMetadata else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : RulesResponseMetadata) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.next_token) {
                case (?v__) List.add(buf, ("next_token", #Text(v__)));
                case null ();
            };
            switch (value.result_count) {
                case (?v__) List.add(buf, ("result_count", #Int(v__)));
                case null ();
            };
            List.add(buf, ("sent", #Text(value.sent)));
            switch (value.summary) {
                case (?v__) List.add(buf, ("summary", RulesRequestSummary.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?RulesResponseMetadata =
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
                    let ?sent_field = Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "sent") else return null;
                    let ?sent = ((switch (sent_field.1) { case (#Text(s)) ?s; case _ null })) else return null;
                    let summary : ?RulesRequestSummary = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "summary")) {
                        case (?summary_field) (RulesRequestSummary.fromCandidValue(summary_field.1));
                        case null null;
                    };
                    ?{
                        next_token;
                        result_count;
                        sent;
                        summary;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level so callers using the
    /// whole-module import pattern (`import T "...";`) can write `T.init {…}`
    /// directly, mirroring the destructure-pattern (`{ type T; JSON = T }`)
    /// shorthand `T.init {…}` that resolves through the JSON alias.
    public let init = JSON.init;
};

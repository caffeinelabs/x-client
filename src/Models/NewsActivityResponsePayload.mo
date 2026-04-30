import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// NewsActivityResponsePayload.mo

module {
    /// The required-fields slice of NewsActivityResponsePayload — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express NewsActivityResponsePayload as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        category : ?Text;
        headline : ?Text;
        hook : ?Text;
        summary : ?Text;
    };

    public type NewsActivityResponsePayload = Required and Optional;

    public module JSON {
        // `init` constructs a NewsActivityResponsePayload from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { NewsActivityResponsePayload.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : NewsActivityResponsePayload {
            let ?res = from_candid(to_candid(required)) : ?NewsActivityResponsePayload else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : NewsActivityResponsePayload) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.category) {
                case (?v__) List.add(buf, ("category", #Text(v__)));
                case null ();
            };
            switch (value.headline) {
                case (?v__) List.add(buf, ("headline", #Text(v__)));
                case null ();
            };
            switch (value.hook) {
                case (?v__) List.add(buf, ("hook", #Text(v__)));
                case null ();
            };
            switch (value.summary) {
                case (?v__) List.add(buf, ("summary", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?NewsActivityResponsePayload =
            switch (candid) {
                case (#Record(fields)) {
                    let category : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "category")) {
                        case (?category_field) ((switch (category_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let headline : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "headline")) {
                        case (?headline_field) ((switch (headline_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let hook : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "hook")) {
                        case (?hook_field) ((switch (hook_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let summary : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "summary")) {
                        case (?summary_field) ((switch (summary_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        category;
                        headline;
                        hook;
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

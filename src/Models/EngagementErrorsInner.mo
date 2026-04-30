import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// EngagementErrorsInner.mo

module {
    /// The required-fields slice of EngagementErrorsInner — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express EngagementErrorsInner as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        error_ : ?Text;
        tweets : ?[Text];
    };

    public type EngagementErrorsInner = Required and Optional;

    public module JSON {
        // `init` constructs a EngagementErrorsInner from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { EngagementErrorsInner.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : EngagementErrorsInner {
            let ?res = from_candid(to_candid(required)) : ?EngagementErrorsInner else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : EngagementErrorsInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.error_) {
                case (?v__) List.add(buf, ("error", #Text(v__)));
                case null ();
            };
            switch (value.tweets) {
                case (?v__) List.add(buf, ("tweets", #Array(Array.map<Text, Candid.Candid>(v__, func(s : Text) : Candid.Candid = #Text(s)))));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?EngagementErrorsInner =
            switch (candid) {
                case (#Record(fields)) {
                    let error_ : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "error")) {
                        case (?error__field) ((switch (error__field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let tweets : ?[Text] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "tweets")) {
                        case (?tweets_field) ((switch (tweets_field.1) {
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
                    ?{
                        error_;
                        tweets;
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

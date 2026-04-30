
import { type ProcessingInfoState; JSON = ProcessingInfoState } "./ProcessingInfoState";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ProcessingInfo.mo

module {
    /// The required-fields slice of ProcessingInfo — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ProcessingInfo as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        check_after_secs : ?Int;
        progress_percent : ?Int;
        state : ?ProcessingInfoState;
    };

    public type ProcessingInfo = Required and Optional;

    public module JSON {
        // `init` constructs a ProcessingInfo from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ProcessingInfo.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ProcessingInfo {
            let ?res = from_candid(to_candid(required)) : ?ProcessingInfo else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ProcessingInfo) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.check_after_secs) {
                case (?v__) List.add(buf, ("check_after_secs", #Int(v__)));
                case null ();
            };
            switch (value.progress_percent) {
                case (?v__) List.add(buf, ("progress_percent", #Int(v__)));
                case null ();
            };
            switch (value.state) {
                case (?v__) List.add(buf, ("state", ProcessingInfoState.toCandidValue(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ProcessingInfo =
            switch (candid) {
                case (#Record(fields)) {
                    let check_after_secs : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "check_after_secs")) {
                        case (?check_after_secs_field) ((switch (check_after_secs_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let progress_percent : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "progress_percent")) {
                        case (?progress_percent_field) ((switch (progress_percent_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let state : ?ProcessingInfoState = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "state")) {
                        case (?state_field) (ProcessingInfoState.fromCandidValue(state_field.1));
                        case null null;
                    };
                    ?{
                        check_after_secs;
                        progress_percent;
                        state;
                    };
                };
                case _ null;
            };
    };

    /// Re-export of `JSON.init` at the outer module level. Three import shapes
    /// all reach the same function:
    ///
    ///   - `import T "...";                                     T.init {…}`     // whole-module
    ///   - `import { type T; JSON = T } "...";                  T.init {…}`     // JSON-alias
    ///   - `import { type T; JSON = T; init = myInit } "...";   myInit {…}`     // explicit rename
    ///
    /// The third form is handy when several models would all be reachable
    /// as `T.init` and you want each bound to a distinct local name.
    public let init = JSON.init;
};

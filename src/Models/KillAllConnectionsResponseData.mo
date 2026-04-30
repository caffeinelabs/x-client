
import { type KillAllConnectionsResponseDataResultsInner; JSON = KillAllConnectionsResponseDataResultsInner } "./KillAllConnectionsResponseDataResultsInner";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// KillAllConnectionsResponseData.mo

module {
    /// The required-fields slice of KillAllConnectionsResponseData — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express KillAllConnectionsResponseData as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        failed_kills : ?Int;
        results : ?[KillAllConnectionsResponseDataResultsInner];
        successful_kills : ?Int;
    };

    public type KillAllConnectionsResponseData = Required and Optional;

    public module JSON {
        // `init` constructs a KillAllConnectionsResponseData from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { KillAllConnectionsResponseData.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : KillAllConnectionsResponseData {
            let ?res = from_candid(to_candid(required)) : ?KillAllConnectionsResponseData else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : KillAllConnectionsResponseData) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.failed_kills) {
                case (?v__) List.add(buf, ("failed_kills", #Int(v__)));
                case null ();
            };
            switch (value.results) {
                case (?v__) List.add(buf, ("results", #Array(Array.map<KillAllConnectionsResponseDataResultsInner, Candid.Candid>(v__, KillAllConnectionsResponseDataResultsInner.toCandidValue))));
                case null ();
            };
            switch (value.successful_kills) {
                case (?v__) List.add(buf, ("successful_kills", #Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?KillAllConnectionsResponseData =
            switch (candid) {
                case (#Record(fields)) {
                    let failed_kills : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "failed_kills")) {
                        case (?failed_kills_field) ((switch (failed_kills_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    let results : ?[KillAllConnectionsResponseDataResultsInner] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "results")) {
                        case (?results_field) ((switch (results_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<KillAllConnectionsResponseDataResultsInner>();
                            for (c__ in xs__.values()) {
                                let ?m__ = KillAllConnectionsResponseDataResultsInner.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let successful_kills : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "successful_kills")) {
                        case (?successful_kills_field) ((switch (successful_kills_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        failed_kills;
                        results;
                        successful_kills;
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

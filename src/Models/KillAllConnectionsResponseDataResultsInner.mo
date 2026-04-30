import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// KillAllConnectionsResponseDataResultsInner.mo

module {
    /// The required-fields slice of KillAllConnectionsResponseDataResultsInner — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express KillAllConnectionsResponseDataResultsInner as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        error_message : ?Text;
        success : ?Bool;
        uuid : ?Text;
    };

    public type KillAllConnectionsResponseDataResultsInner = Required and Optional;

    public module JSON {
        // `init` constructs a KillAllConnectionsResponseDataResultsInner from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { KillAllConnectionsResponseDataResultsInner.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : KillAllConnectionsResponseDataResultsInner {
            let ?res = from_candid(to_candid(required)) : ?KillAllConnectionsResponseDataResultsInner else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : KillAllConnectionsResponseDataResultsInner) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.error_message) {
                case (?v__) List.add(buf, ("error_message", #Text(v__)));
                case null ();
            };
            switch (value.success) {
                case (?v__) List.add(buf, ("success", #Bool(v__)));
                case null ();
            };
            switch (value.uuid) {
                case (?v__) List.add(buf, ("uuid", #Text(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?KillAllConnectionsResponseDataResultsInner =
            switch (candid) {
                case (#Record(fields)) {
                    let error_message : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "error_message")) {
                        case (?error_message_field) ((switch (error_message_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let success : ?Bool = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "success")) {
                        case (?success_field) ((switch (success_field.1) { case (#Bool(b)) ?b; case _ null }));
                        case null null;
                    };
                    let uuid : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "uuid")) {
                        case (?uuid_field) ((switch (uuid_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    ?{
                        error_message;
                        success;
                        uuid;
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

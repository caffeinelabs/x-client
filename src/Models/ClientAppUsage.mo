/// Usage per client app

import { type UsageFields; JSON = UsageFields } "./UsageFields";
import { Candid } "mo:serde-core";
import Array "mo:core/Array";
import List "mo:core/List";
import Float "mo:core/Float";
import Runtime "mo:core/Runtime";

// ClientAppUsage.mo

module {
    /// The required-fields slice of ClientAppUsage — what `init` consumes.
    /// Exposed so callers can write `let req : Required = {...}` if they want
    /// to manipulate the required-only payload independently of the full record.
    public type Required = {
    };

    // Optional-fields slice. Private — not part of the consumer surface;
    // it's an internal scaffold so we can express ClientAppUsage as an
    // `and`-intersection and keep `init` from listing every optional explicitly.
    type Optional = {
        client_app_id : ?Text;
        usage : ?[UsageFields];
        usage_result_count : ?Int;
    };

    public type ClientAppUsage = Required and Optional;

    public module JSON {
        // `init` constructs a ClientAppUsage from just its required fields,
        // defaulting all optional fields to `null`. Pair with record-update
        // syntax to layer in selected optionals:
        //   let req = { ClientAppUsage.init { …required fields… } with someOpt = ?… };
        // Implementation uses Candid round-trip — Candid record subtyping fills
        // absent optional fields with null. Costs a few cycles per call (init is
        // not on a hot path) but keeps generated code compact regardless of how
        // many optional fields the model has.
        public func init(required : Required) : ClientAppUsage {
            let ?res = from_candid(to_candid(required)) : ?ClientAppUsage else Runtime.unreachable();
            res
        };

        public func toCandidValue(value : ClientAppUsage) : Candid.Candid {
            let buf = List.empty<(Text, Candid.Candid)>();
            switch (value.client_app_id) {
                case (?v__) List.add(buf, ("client_app_id", #Text(v__)));
                case null ();
            };
            switch (value.usage) {
                case (?v__) List.add(buf, ("usage", #Array(Array.map<UsageFields, Candid.Candid>(v__, UsageFields.toCandidValue))));
                case null ();
            };
            switch (value.usage_result_count) {
                case (?v__) List.add(buf, ("usage_result_count", #Int(v__)));
                case null ();
            };
            #Record(List.toArray(buf));
        };

        public func fromCandidValue(candid : Candid.Candid) : ?ClientAppUsage =
            switch (candid) {
                case (#Record(fields)) {
                    let client_app_id : ?Text = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "client_app_id")) {
                        case (?client_app_id_field) ((switch (client_app_id_field.1) { case (#Text(s)) ?s; case _ null }));
                        case null null;
                    };
                    let usage : ?[UsageFields] = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "usage")) {
                        case (?usage_field) ((switch (usage_field.1) {
                        case (#Array(xs__)) {
                            let buf__ = List.empty<UsageFields>();
                            for (c__ in xs__.values()) {
                                let ?m__ = UsageFields.fromCandidValue(c__) else return null;
                                List.add(buf__, m__);
                            };
                            ?List.toArray(buf__);
                        };
                        case _ null;
                    }));
                        case null null;
                    };
                    let usage_result_count : ?Int = switch (Array.find<(Text, Candid.Candid)>(fields, func((k, _) : (Text, Candid.Candid)) : Bool = k == "usage_result_count")) {
                        case (?usage_result_count_field) ((switch (usage_result_count_field.1) { case (#Int(i)) ?i; case (#Nat(n)) ?n; case _ null }));
                        case null null;
                    };
                    ?{
                        client_app_id;
                        usage;
                        usage_result_count;
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
